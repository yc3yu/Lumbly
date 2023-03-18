//
//  RecordingViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import AVFoundation
import SwiftUI
import UIKit

class RecordingViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
    private let captureSession = AVCaptureSession()
    
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    private var movieFileOutput = AVCaptureMovieFileOutput()

    private var permissionGranted = false // Flag for permission
    
    private var previewLayer = AVCaptureVideoPreviewLayer()

    private var screenRect: CGRect! = nil // For view dimensions
    
    private var temporaryVideoFileURL: String = ""

    override func viewDidLoad() {
        checkPermission()
        
        sessionQueue.async { [unowned self] in
            guard permissionGranted else { return }
            self.setupCaptureSession()
            self.captureSession.startRunning()
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        screenRect = UIScreen.main.bounds
        self.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)

        UIView.setAnimationsEnabled(false)
        
        switch UIDevice.current.orientation {
            // Home button on top
        case UIDeviceOrientation.portraitUpsideDown:
            self.previewLayer.connection?.videoOrientation = .portraitUpsideDown
            
            // Home button on right
        case UIDeviceOrientation.landscapeLeft:
            self.previewLayer.connection?.videoOrientation = .landscapeRight
            
            // Home button on left
        case UIDeviceOrientation.landscapeRight:
            self.previewLayer.connection?.videoOrientation = .landscapeLeft
            
            // Home button at bottom
        case UIDeviceOrientation.portrait:
            self.previewLayer.connection?.videoOrientation = .portrait
            
        default:
            break
        }
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            // Permission has been granted before
        case .authorized:
            permissionGranted = true
            
            // Permission has not been requested yet
        case .notDetermined:
            requestPermission()
            
        default:
            permissionGranted = false
        }
    }
    
    func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        }
    }
    
    func setupCaptureSession() {
        setupInputs()
        
        setupPreviewLayer()
        
        setupOutputs()
    }
    
    func setupInputs() {
        captureSession.beginConfiguration()
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,for: .video, position: .front) else { return }
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else { return }
        guard captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)
        captureSession.commitConfiguration()
    }
    
    func setupPreviewLayer() {
        screenRect = UIScreen.main.bounds
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill // Fill screen
        previewLayer.connection?.videoOrientation = .portrait
        
        DispatchQueue.main.async { [weak self] in
            self!.view.layer.addSublayer(self!.previewLayer)
        }
    }
    
    func setupOutputs() {
        guard captureSession.canAddOutput(movieFileOutput) else {
            fatalError("Could not add video output.")
        }
        
        captureSession.beginConfiguration()
        captureSession.addOutput(movieFileOutput)
        captureSession.sessionPreset = .high
        
        if let connection = movieFileOutput.connection(with: .video) {
            if connection.isVideoStabilizationSupported {
                connection.preferredVideoStabilizationMode = .auto
            }
        }
        captureSession.commitConfiguration()
    }
    
    /// Disable autorotation of the interface when recording is in progress.
    override var shouldAutorotate: Bool {
        return !movieFileOutput.isRecording
    }

    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
    
    }
}

extension RecordingViewController: RecordingViewControllerLinkable {
    func action(_ action : RecordingLinkAction) {
        switch action {
        case .startRecording:
            startRecording()
        case .stopRecording:
            stopRecording()
        }
    }
    
    func startRecording() {
        func getCurrentDateString() -> String {
            let today = Date.now
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "yyyyMMdd-HHmmss"
            
            return dateFormatter.string(from: today)
        }
        
        let videoPreviewLayerOrientation = previewLayer.connection?.videoOrientation
        
        sessionQueue.async {
            // Update the orientation on the movie file output video connection before recording.
            let movieFileOutputConnection = self.movieFileOutput.connection(with: .video)
            movieFileOutputConnection?.videoOrientation = videoPreviewLayerOrientation ?? .landscapeLeft
            
            let availableVideoCodecTypes = self.movieFileOutput.availableVideoCodecTypes
            
            if availableVideoCodecTypes.contains(.hevc) {
                self.movieFileOutput.setOutputSettings([AVVideoCodecKey: AVVideoCodecType.hevc], for: movieFileOutputConnection!)
            }
            
            // Start recording video to a temporary file.
            let outputFileName = getCurrentDateString()
            self.temporaryVideoFileURL = (NSTemporaryDirectory() as NSString).appendingPathComponent((outputFileName as NSString).appendingPathExtension("mov")!)
            self.movieFileOutput.startRecording(to: URL(fileURLWithPath: self.temporaryVideoFileURL), recordingDelegate: self)
        }
    }
    
    func stopRecording() {
        movieFileOutput.stopRecording()
    }
}
