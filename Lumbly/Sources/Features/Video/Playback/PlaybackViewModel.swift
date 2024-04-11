//
//  PlaybackViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel: ObservableObject {
        private var apiHandler: APIHandler
        
        private(set) var videoFileURL: URL?
        
        @Published var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel, videoFileURL: URL?) {
            self.apiHandler = APIHandler()
            self.recordingViewModel = recordingViewModel
            self.videoFileURL = videoFileURL
        }
        
        func uploadVideo() {
            if let videoFileURL = videoFileURL {
                apiHandler.uploadVideo(parentExerciseSet: recordingViewModel.parentExerciseSet,
                                       exerciseName: recordingViewModel.exerciseName,
                                       videoFileURL: videoFileURL) { [weak self] in
                    self?.removeTemporaryVideo()
                }
            }
        }
        
        func removeTemporaryVideo() {
            if let videoFileURL = videoFileURL {
                let path = videoFileURL.path
                
                guard FileManager.default.fileExists(atPath: path) else { return }
                
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch {
                    print("Error removing file at url: \(videoFileURL)")
                }
            } else {
                print("Url does not exist")
            }
        }
    }
}
