//
//  ExerciseTipViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct ExerciseTip: Decodable, Hashable {
    var tipName: String?
    var tipDescription: String?
    var tipImage: String?
}

extension ExerciseTipView {
    class ExerciseTipViewModel: ObservableObject {
        @Published private(set) var tipNumber: Int?
        @Published private(set) var exerciseTipData: ExerciseTip?
        
        init(tipNumber: Int, exerciseTipData: ExerciseTip?) {
            self.tipNumber = tipNumber
            self.exerciseTipData = exerciseTipData
        }
    }
}
