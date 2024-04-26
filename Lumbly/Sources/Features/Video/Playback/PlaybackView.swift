//
//  PlaybackView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-18.
//

import AVKit
import SwiftUI

struct PlaybackView: View {
    private struct Constants {
        static let maxOptionsModalWidth = 400.0
    }
    
    private var leftOptionDestination: RecordingView {
        let newViewModel = RecordingView.RecordingViewModel(isTestRun: false,
                                                            parentExerciseSet: viewModel.recordingViewModel.parentExerciseSet,
                                                            exerciseName: viewModel.recordingViewModel.exerciseName,
                                                            recordingInfoModalBodyText: viewModel.recordingViewModel.recordingInfoModalBodyText,
                                                            timestamp: viewModel.recordingViewModel.timestamp,
                                                            parentView: viewModel.recordingViewModel.parentView)
        return RecordingView(viewModel: newViewModel)
    }
    
    private var rightOptionDestination: RecordingView {
        let newViewModel = RecordingView.RecordingViewModel(isTestRun: true,
                                                            parentExerciseSet: viewModel.recordingViewModel.parentExerciseSet,
                                                            exerciseName: viewModel.recordingViewModel.exerciseName,
                                                            recordingInfoModalBodyText: viewModel.recordingViewModel.recordingInfoModalBodyText,
                                                            timestamp: viewModel.recordingViewModel.timestamp,
                                                            parentView: viewModel.recordingViewModel.parentView)
        return RecordingView(viewModel: newViewModel)
    }
    
    @State private var player = AVPlayer()
    @State var viewModel: PlaybackViewModel
    
    var body: some View {
        if let videoFileURL = viewModel.videoFileURL {
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear() {
                    AppDelegate.orientationLock = UIInterfaceOrientationMask.landscapeRight
                    
                    player = AVPlayer(url: videoFileURL)
                    player.play()
                }
                .onDisappear {
                    if viewModel.recordingViewModel.isTestRun {
                        FileManager.default.removeFile(atURL: videoFileURL)
                    }
                }
                .overlay(alignment: .top) {
                    makeOverlay()
                        .padding(.top, .miniSpace)
                        .frame(maxWidth: Constants.maxOptionsModalWidth)
                }
                .navigationBarBackButtonHidden(viewModel.recordingViewModel.isTestRun)
                .navigationBarItems(trailing: NavigationLink(destination: PainLevelRatingView(viewModel:
                        .init(recordingViewModel: viewModel.recordingViewModel))) {
                    if !viewModel.recordingViewModel.isTestRun {
                        Text(L10n.NavigationBarItem.submit)
                    }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                    
                    Task {
                        await viewModel.uploadVideo()
                    }
                }))
        } // TODO: Handle error case (show error screen or modal and ask them to retry recording)
    }
    
    @ViewBuilder
    func makeOverlay() -> some View {
        if viewModel.recordingViewModel.isTestRun {
            RecordingOptionsModalView(viewModel:
                    .init(text: L10n.RecordingOptionsModalView.reviewRecording,
                          showOptions: true,
                          leftOptionDestination: leftOptionDestination,
                          rightOptionDestination: rightOptionDestination))
        }
    }
}
