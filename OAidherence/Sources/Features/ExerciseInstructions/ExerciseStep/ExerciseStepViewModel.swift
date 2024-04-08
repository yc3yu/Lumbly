//
//  ExerciseStepViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

struct ExerciseStep: Decodable, Hashable {
    var stepNumber: Int?
    var stepString: String?
    var stepImage: String?
}

extension ExerciseStepView {
    class ExerciseStepViewModel: ObservableObject {
        @Published private(set) var exerciseStepData: ExerciseStep?
        
        init(exerciseStepData: ExerciseStep?) {
            self.exerciseStepData = exerciseStepData
        }
    }
}
