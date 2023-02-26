//
//  ExerciseTipViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct ExerciseTip: Decodable {
    var tipName: String?
    var tipDescription: String?
    var tipImage: String?
}

extension ExerciseTipView {
    class ExerciseTipViewModel: ObservableObject {
        @Published private(set) var exerciseTipData: ExerciseTip?
        
        init(exerciseTipData: ExerciseTip?) {
            self.exerciseTipData = exerciseTipData
        }
    }
}
