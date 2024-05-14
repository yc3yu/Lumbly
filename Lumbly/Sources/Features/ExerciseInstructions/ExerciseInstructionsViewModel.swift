//
//  ExerciseInstructionsViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

extension ExerciseInstructionsView {
    class ViewModel: ObservableObject {
        @Published private(set) var exerciseInstructionsData: ExerciseInstructions? = nil
        @Published private(set) var isLoading: Bool = false
        
        private(set) var parentExerciseSet: String
        private(set) var exerciseNumber: Int
        private(set) var exerciseInstructionsURL: String?
        private(set) var showReadyButton: Bool

        var isTestRun: Bool
        
        init(parentExerciseSet: String, exerciseNumber: Int, exerciseInstructionsURL: String?, showReadyButton: Bool = false, isTestRun: Bool) {
            self.parentExerciseSet = parentExerciseSet
            self.exerciseNumber = exerciseNumber
            self.exerciseInstructionsURL = exerciseInstructionsURL
            self.showReadyButton = showReadyButton
            self.isTestRun = isTestRun
        }
        
        @MainActor func fetchExerciseInstructionsData() async {
            guard !isLoading else { return }
            defer { isLoading =  false }
            isLoading = true
            
            var resource = ExerciseInstructionsResource()
            resource.setURL(withString: exerciseInstructionsURL)
            
            let request = APIRequest(resource: resource)
            
            exerciseInstructionsData = try? await request.execute()
        }
    }
}
