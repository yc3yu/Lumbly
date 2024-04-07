//
//  ResultsForDayViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-04-07.
//

import SwiftUI

extension ResultsForDayView {
    class ResultsForDayViewModel {
        var dayOfWeek: String
        var didExercise: Bool
        
        init(dayOfWeek: String, didExercise: Bool) {
            self.dayOfWeek = dayOfWeek
            self.didExercise = didExercise
        }
    }
}
