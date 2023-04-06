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
        static let maxOptionsModalWidth: CGFloat = 400.0
    }
    
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
    
    private var parentView: ExerciseInstructionsView {
        viewModel.parentView.viewModel.isTestRun = viewModel.isTestRun
        return viewModel.parentView
    }
    
    @ObservedObject var viewControllerLink = RecordingViewControllerLink()
    
    @State private var isRecording = false
    @State private var orientation = UIDevice.current.orientation
    @State var shouldPresentPlayback = false
    @State var videoFileURL: URL? = nil
    @State var timestamp: String? = nil
    @State var viewModel: RecordingViewModel
    
    var body: some View {
        ZStack {
            HostedRecordingViewController(videoFileURL: $videoFileURL, timestamp: $timestamp, viewControllerLink: viewControllerLink)
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
        .navigationBarBackButtonHidden(true)
        .overlay(alignment: .topLeading) {
            makeInfoModalOverlay()
                .padding([.top, .leading], .miniSpace)
        }
        .overlay(alignment: .top) {
            makeOptionsModalOverlay()
                .padding(.top, .miniSpace)
                .frame(maxWidth: Constants.maxOptionsModalWidth)
        }
    }
    
    func makeRecordingButton() -> some View {
        Button(action: {
            viewControllerLink.performAction(action: buttonAction)
            
            isRecording.toggle()
            
            if !isRecording {
                shouldPresentPlayback = true
            }
        }) {
            Image(recordingButtonImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.recordingButtonSize, height: Constants.recordingButtonSize)
        }
        .navigationDestination(isPresented: $shouldPresentPlayback) {
            if let videoFileURL = videoFileURL {
                PlaybackView(viewModel:
                        .init(recordingViewModel: viewModel,
                              videoFileURL: videoFileURL))
            }
        }
    }
    
    @ViewBuilder
    func makeInfoModalOverlay() -> some View {
        RecordingInfoModalView(viewModel: .init(exerciseName: viewModel.exerciseName,
                                                bodyText: viewModel.recordingInfoModalBodyText,
                                                isTestRun: viewModel.isTestRun,
                                                infoNavLinkDestination: parentView))
    }
    
    @ViewBuilder
    func makeOptionsModalOverlay() -> some View {
        if viewModel.isTestRun {
            if isRecording {
                RecordingOptionsModalView<AnyView>(viewModel:
                        .init(text: L10n.RecordingOptionsModalView.moveAwayDoOneRep,
                              showOptions: false))
            } else {
                RecordingOptionsModalView<AnyView>(viewModel:
                        .init(text: L10n.RecordingOptionsModalView.putDeviceOnGround,
                              showOptions: false))
            }
        } else {
            if !isRecording {
                RecordingOptionsModalView<AnyView>(viewModel:
                        .init(text: L10n.RecordingOptionsModalView.rememberToPosition,
                              showOptions: false))
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
