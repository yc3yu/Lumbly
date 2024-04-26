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
        
        init(isTestRun: Bool,
             parentExerciseSet: String,
             exerciseName: String,
             videoFileURL: URL? = nil,
             recordingInfoModalBodyText: String? = nil,
             timestamp: String? = nil,
             parentView: ExerciseInstructionsView) {
            self.isTestRun = isTestRun
            self.parentExerciseSet = parentExerciseSet
            self.exerciseName = exerciseName
            self.videoFileURL = videoFileURL
            self.timestamp = timestamp
            self.recordingInfoModalBodyText = recordingInfoModalBodyText
            self.parentView = parentView
        }
    }
}
