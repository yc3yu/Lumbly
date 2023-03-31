//
//  RecordingViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-30.
//

import SwiftUI

extension RecordingView {
    class RecordingViewModel: ObservableObject {
        @Published private(set) var parentExerciseSet: String
        @Published private(set) var exerciseName: String
        @Published private(set) var timestamp: String?

        init(parentExerciseSet: String, exerciseName: String, timestamp: String?) {
            self.parentExerciseSet = parentExerciseSet
            self.exerciseName = exerciseName
            self.timestamp = timestamp
        }
    }
}
