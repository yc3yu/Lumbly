//
//  ExerciseTileViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-19.
//

import SwiftUI

struct ExerciseTile: Decodable, Hashable {
    var inlineIcon: String?
    var exerciseName: String?
    var repetitions: String?
    var exerciseImage: String?
}

extension ExerciseTileView {
    class ExerciseTileViewModel: ObservableObject {
        @Published private(set) var exerciseTileData: ExerciseTile?
        
        init(exerciseTileData: ExerciseTile?) {
            self.exerciseTileData = exerciseTileData
        }
    }
}
