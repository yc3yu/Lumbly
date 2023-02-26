//
//  ExerciseInstructionsViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

struct ExerciseInstructions: Decodable {
    var exerciseName: String?
    var repetitions: String?
    var mainImage: String?
    var exerciseSteps: [ExerciseStep]?
//    var exerciseTips: [ExerciseTip]? // TODO: Add later
}

extension ExerciseInstructionsView {
    class ExerciseInstructionsViewModel: ObservableObject {
        private let apiHandler: APIHandler

        @Published private(set) var exerciseNumber: Int
        @Published private(set) var exerciseInstructionsURL: String?
        @Published private(set) var exerciseInstructionsData: ExerciseInstructions? = nil
        
        init(exerciseNumber: Int, exerciseInstructionsURL: String?) {
            self.apiHandler = APIHandler()
            self.exerciseNumber = exerciseNumber
            self.exerciseInstructionsURL = exerciseInstructionsURL
            fetchData()
        }

        func fetchData() {
        }
    }
}
