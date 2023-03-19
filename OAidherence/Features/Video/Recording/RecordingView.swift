//
//  RecordingView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import SwiftUI

struct RecordingView: View {
    private struct Constants {
        static let recordingButtonSize: CGFloat = 72.0
    }
    
    @ObservedObject var viewControllerLink = RecordingViewControllerLink()
    
    @State var videoFileURL: URL? = nil
    
    @State private var isRecording = false
    
    @State private var shouldPresentPlayback = false
    
    @State private var orientation = UIDevice.current.orientation
    
    private var recordingButtonImage: String {
        if self.isRecording {
            return "RecordingButtonStop"
        } else {
            return "RecordingButtonStart"
        }
    }
    
    private var buttonAction: RecordingLinkAction {
        switch isRecording {
        case true:
            return .stopRecording
        case false:
            return .startRecording
        }
    }
    
    var body: some View {
        ZStack {
            HostedRecordingViewController(videoFileURL: $videoFileURL, viewControllerLink: viewControllerLink)
                .ignoresSafeArea(.container, edges: .horizontal)

            Group {
                switch orientation {
                case .portrait, .faceUp, .faceDown:
                    VStack {
                        Spacer()
                        
                        makeRecordingButton()
                            .padding(.bottom, .smallSpace)
                    }
                case .landscapeRight:
                    HStack {
                        Spacer()
                        
                        makeRecordingButton()
                    }
                default:
                    HStack {
                        Spacer()
                        
                        makeRecordingButton()
                            .padding(.trailing, .smallSpace)
                    }
                }
            }
            .onRotate { newOrientation in
                orientation = newOrientation
            }
        }
    }
    
    func makeRecordingButton() -> some View {
        Button(action: {
            viewControllerLink.performAction(action: buttonAction)
            if isRecording {
                shouldPresentPlayback = true
            }
            
            isRecording.toggle()
        }) {
            Image(recordingButtonImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.recordingButtonSize, height: Constants.recordingButtonSize)
        }
        .fullScreenCover(isPresented: $shouldPresentPlayback) {
            if let videoFileURL = videoFileURL {
                PlaybackView(videoFileURL: videoFileURL)
            }
        }
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
