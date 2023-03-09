//
//  ExerciseSetViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

struct ExerciseSet: Decodable {
    var name: String?
    var duration: String?
    var physiotherapyIcon: String?
    var physiotherapyString: String?
    var exerciseTiles: [ExerciseTile]?
}

extension ExerciseSetView {
    class ExerciseSetViewModel: ObservableObject {
        private let apiHandler: APIHandler
        
        @Published private(set) var exerciseSetURL: String?
        @Published private(set) var exerciseSetData: ExerciseSet? = nil
        
        init(exerciseSetURL: String?) {
            self.apiHandler = APIHandler()
            self.exerciseSetURL = exerciseSetURL
            fetchData()
        }

        func fetchData() {
            apiHandler.fetchExerciseSetData(exerciseSetURL: exerciseSetURL) { [weak self] exerciseSetData in
                self?.exerciseSetData = exerciseSetData
            }
        }
    }
}
