//
//  RecordingInfoModalViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-04-03.
//

import SwiftUI

extension RecordingInfoModalView {
    class RecordingInfoModalViewModel: ObservableObject {
        var exerciseName: String
        var bodyText: String?
        var isTestRun: Bool
        var infoNavLinkDestination: DestinationView
        
        init(exerciseName: String, bodyText: String? = nil, isTestRun: Bool, infoNavLinkDestination: DestinationView) {
            self.exerciseName = exerciseName
            self.bodyText = bodyText
            self.isTestRun = isTestRun
            self.infoNavLinkDestination = infoNavLinkDestination
        }
    }
}
