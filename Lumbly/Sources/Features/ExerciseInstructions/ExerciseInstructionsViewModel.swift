//
//  ExerciseInstructionsViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

struct ExerciseInstructions: Decodable {
    var exerciseName: String?
    var repetitions: String?
    var recordingInfoModalBodyText: String?
    var mainImage: String?
    var exerciseSteps: [ExerciseStep]?
    var exerciseTips: [ExerciseTip]?
}

extension ExerciseInstructionsView {
    class ExerciseInstructionsViewModel: ObservableObject {
        private let apiHandler: APIHandler

        @Published private(set) var exerciseNumber: Int
        @Published private(set) var exerciseInstructionsData: ExerciseInstructions? = nil
        @Published private(set) var isLoading: Bool = false
        @Published var showReadyButton: Bool
        
        private(set) var exerciseInstructionsURL: String?
        
        var parentExerciseSet: String
        var isTestRun: Bool
        
        init(parentExerciseSet: String, exerciseNumber: Int, exerciseInstructionsURL: String?, showReadyButton: Bool = false, isTestRun: Bool) {
            self.apiHandler = APIHandler()
            self.parentExerciseSet = parentExerciseSet
            self.exerciseNumber = exerciseNumber
            self.exerciseInstructionsURL = exerciseInstructionsURL
            self.showReadyButton = showReadyButton
            self.isTestRun = isTestRun
            
            fetchData()
        }

        func fetchData() {
            isLoading = true
            apiHandler.fetchExerciseInstructionsData(exerciseInstructionsURL: exerciseInstructionsURL) { [weak self] exerciseInstructionsData in
                self?.exerciseInstructionsData = exerciseInstructionsData
                self?.isLoading = false
            }
        }
    }
}
