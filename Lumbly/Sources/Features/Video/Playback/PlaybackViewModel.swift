//
//  PlaybackViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel: ObservableObject {
        @Published var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel) {
            self.recordingViewModel = recordingViewModel
        }
        
        func uploadVideo() async {
            guard let fileURL = recordingViewModel.videoFileURL else {
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
            
            if let fileManager = recordingViewModel.fileManager {
                fileManager.removeFile(atURL: fileURL)
            }
        }
    }
}
