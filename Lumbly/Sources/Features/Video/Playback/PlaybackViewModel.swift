//
//  PlaybackViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel: ObservableObject {
        private(set) var videoFileURL: URL?
        
        @Published var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel, videoFileURL: URL?) {
            self.recordingViewModel = recordingViewModel
            self.videoFileURL = videoFileURL
        }
        
        func uploadVideo() async {
            guard let fileURL = videoFileURL else {
                // TODO: Handle error
                return
            }
            
            let uploadName = "\(recordingViewModel.parentExerciseSet)/\(recordingViewModel.exerciseName)/\(fileURL.lastPathComponent)"
            let resource = AZSUploadResource(containerName: APIEndpoints.userID,
                                             uploadName: uploadName,
                                             fileURL: fileURL)
            
            let upload = AZSUpload(resource: resource)
            do {
                try await upload.execute()
            } catch {
                // TODO: Handle error
            }

            FileManager.default.removeFile(atURL: videoFileURL)
        }
    }
}
