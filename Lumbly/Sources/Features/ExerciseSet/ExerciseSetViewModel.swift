//
//  ExerciseSetViewModel.swift
//  Lumbly
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
        @Published var isLoading: Bool = false
        
        init(exerciseSetURL: String?) {
            self.apiHandler = APIHandler()
            self.exerciseSetURL = exerciseSetURL
            fetchData()
        }

        func fetchData() {
            isLoading = true
            apiHandler.fetchExerciseSetData(exerciseSetURL: exerciseSetURL) { [weak self] exerciseSetData in
                self?.exerciseSetData = exerciseSetData
                self?.isLoading = false
            }
        }
    }
}
