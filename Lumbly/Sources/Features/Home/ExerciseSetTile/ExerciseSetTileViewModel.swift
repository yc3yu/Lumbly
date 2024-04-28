//
//  ExerciseSetTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

extension ExerciseSetTileView {
    class ExerciseSetTileViewModel: ObservableObject {
        @Published private(set) var exerciseSetTileData: ExerciseSetTile?
        
        init(exerciseSetTileData: ExerciseSetTile?) {
            self.exerciseSetTileData = exerciseSetTileData
        }
    }
}
