//
//  ExerciseStepViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

extension ExerciseStepView {
    class ViewModel: ObservableObject {
        @Published private(set) var exerciseStepData: ExerciseStep?
        
        init(exerciseStepData: ExerciseStep?) {
            self.exerciseStepData = exerciseStepData
        }
    }
}
