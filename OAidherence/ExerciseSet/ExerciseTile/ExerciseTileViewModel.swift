//
//  ExerciseTileViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-19.
//

import SwiftUI

struct ExerciseTile: Decodable {
    var inlineIcon: String?
    var exerciseName: String?
    var reps: String?
    var exerciseImage: String?
}

extension ExerciseTileView {
    class ExerciseTileViewModel : ObservableObject {
        private let apiHandler: APIHandler
        
        @Published private(set) var exerciseTileData: ExerciseTile? = nil
        
        init() {
            self.apiHandler = APIHandler()
            fetchData()
        }

        func fetchData() {
            apiHandler.fetchExerciseTileData() { [weak self] data in
                self?.exerciseTileData = data
            }
        }
    }
}
