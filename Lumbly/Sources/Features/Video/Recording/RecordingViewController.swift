//
//  RecordingViewController.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-16.
//

import AVFoundation
import SwiftUI
import UIKit

class RecordingViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private let fileManager = FileManager.default
    
    private var movieFileOutput = AVCaptureMovieFileOutput()
    private var permissionGranted = false
    private var previewLayer = AVCaptureVideoPreviewLayer()
    private var screenRect: CGRect! = nil // For view dimensions
    private var backgroundRecordingID: UIBackgroundTaskIdentifier?
    
    weak var delegate: RecordingViewControllerDelegate?
    
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
        
        self.previewLayer.connection?.videoOrientation = .landscapeRight
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            permissionGranted = true
            
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
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
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
        captureSession.sessionPreset = .medium
        
        if let connection = movieFileOutput.connection(with: .video) {
            if connection.isVideoStabilizationSupported {
                connection.preferredVideoStabilizationMode = .auto
            }
        }
        captureSession.commitConfiguration()
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let currentBackgroundRecordingID = backgroundRecordingID {
            UIApplication.shared.endBackgroundTask(currentBackgroundRecordingID)
        }
    }
}

extension RecordingViewController: RecordingViewControllerLinkable {
    private struct Constants {
        static let dateFormat: String = "yyyyMMdd-HHmmss"
        static let videoFileExtension: String = ".mov"
    }

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
            
            dateFormatter.dateFormat = Constants.dateFormat
            
            return dateFormatter.string(from: today)
        }
        
        let videoPreviewLayerOrientation = previewLayer.connection?.videoOrientation
        
        sessionQueue.async {
            if UIDevice.current.isMultitaskingSupported {
                self.backgroundRecordingID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
            }
            
            /// Update the orientation on the movie file output video connection before recording.
            let movieFileOutputConnection = self.movieFileOutput.connection(with: .video)
            movieFileOutputConnection?.videoOrientation = videoPreviewLayerOrientation ?? .landscapeRight
            movieFileOutputConnection?.automaticallyAdjustsVideoMirroring = false
            movieFileOutputConnection?.isVideoMirrored = true
            
            let availableVideoCodecTypes = self.movieFileOutput.availableVideoCodecTypes
            
            if availableVideoCodecTypes.contains(.hevc) {
                self.movieFileOutput.setOutputSettings([AVVideoCodecKey: AVVideoCodecType.hevc], for: movieFileOutputConnection!)
            }
            
            /// Start recording video to a temporary file.
            let outputFileName = getCurrentDateString() + Constants.videoFileExtension
            let temporaryVideoURL = self.fileManager.temporaryDirectory.appendingPathComponent(outputFileName)
            
            self.delegate?.videoFileUrlSet(self, fileManager: self.fileManager, videoFileURL: temporaryVideoURL, timestamp: outputFileName)
            self.movieFileOutput.startRecording(to: temporaryVideoURL, recordingDelegate: self)
        }
    }
    
    func stopRecording() {
        movieFileOutput.stopRecording()
    }
}
