//
//  RecordingViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-30.
//

import SwiftUI

extension RecordingView {
    class RecordingViewModel: ObservableObject {
        @Published private(set) var isTestRun: Bool
        @Published private(set) var parentExerciseSet: String
        @Published private(set) var exerciseName: String
        @Published private(set) var recordingInfoModalBodyText: String?
        
        @Published var videoFileURL: URL?
        @Published var timestamp: String?
        
        var parentView: ExerciseInstructionsView
        var fileManager: FileManager? = nil
        
        init(isTestRun: Bool,
             parentView: ExerciseInstructionsView,
             parentExerciseSet: String,
             exerciseName: String,
             recordingInfoModalBodyText: String? = nil,
             videoFileURL: URL? = nil,
             timestamp: String? = nil) {
            self.isTestRun = isTestRun
            self.parentView = parentView
            self.parentExerciseSet = parentExerciseSet
            self.exerciseName = exerciseName
            self.recordingInfoModalBodyText = recordingInfoModalBodyText
            self.videoFileURL = videoFileURL
            self.timestamp = timestamp
        }
    }
}
