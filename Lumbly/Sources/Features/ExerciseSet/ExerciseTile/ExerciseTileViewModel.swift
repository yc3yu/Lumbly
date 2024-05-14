//
//  ExerciseTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-19.
//

import SwiftUI

extension ExerciseTileView {
    class ViewModel: ObservableObject {
        @Published private(set) var exerciseTileData: ExerciseTile?
        
        init(exerciseTileData: ExerciseTile?) {
            self.exerciseTileData = exerciseTileData
        }
    }
}
