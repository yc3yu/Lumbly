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
        
        @Published private(set) var exerciseSet: ExerciseSet? = nil
        
        init() {
            self.apiHandler = APIHandler()
            fetchData()
        }

        func fetchData() {
            apiHandler.fetchExerciseSetData() { [weak self] data in
                self?.exerciseSet = data
            }
        }
    }
}
