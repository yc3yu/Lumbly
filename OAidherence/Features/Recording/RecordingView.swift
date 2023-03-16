//
//  RecordingView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import SwiftUI

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

struct RecordingView: View {
    private struct Constants {
        static let recordingButtonSize: CGFloat = 72.0
    }
    
    private var viewController = HostedRecordingViewController()
    
    @State private var isRecording: Bool = false
    @State private var orientation = UIDeviceOrientation.portrait
    
    private var recordingButtonImage: String {
        if self.isRecording {
            return "RecordingButtonStop"
        } else {
            return "RecordingButtonStart"
        }
    }
    
    var body: some View {
        ZStack {
            viewController
                .ignoresSafeArea(.container, edges: .horizontal)

            Group {
                switch orientation {
                case .portrait:
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            self.isRecording.toggle()
                        }) {
                            Image(recordingButtonImage)
                                .resizable()
                                .frame(width: Constants.recordingButtonSize, height: Constants.recordingButtonSize)
                                .padding(.bottom, .smallSpace)
                        }
                    }
                case .landscapeRight:
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isRecording.toggle()
                        }) {
                            Image(recordingButtonImage)
                                .resizable()
                                .frame(width: Constants.recordingButtonSize, height: Constants.recordingButtonSize)
                        }
                    }
                default:
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.isRecording.toggle()
                        }) {
                            Image(recordingButtonImage)
                                .resizable()
                                .frame(width: Constants.recordingButtonSize, height: Constants.recordingButtonSize)
                                .padding(.trailing, .smallSpace)
                        }
                    }
                }
            }
            .onRotate { newOrientation in
                orientation = newOrientation
            }
        }
    }
}
