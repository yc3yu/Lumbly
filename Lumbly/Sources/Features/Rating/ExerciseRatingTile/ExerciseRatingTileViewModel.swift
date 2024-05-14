//
//  ExerciseRatingTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

extension ExerciseRatingTileView {
    class ViewModel: ObservableObject {
        @Published private(set) var exerciseRating: String?
        
        init(exerciseRating: String?) {
            self.exerciseRating = exerciseRating
        }
    }
}
