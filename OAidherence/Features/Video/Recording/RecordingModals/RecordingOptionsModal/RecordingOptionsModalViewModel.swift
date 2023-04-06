//
//  RecordingOptionsModalViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-04-05.
//

import SwiftUI

extension RecordingOptionsModalView {
    class RecordingOptionsModalViewModel {
        @Published var text: String
        @Published var showOptions: Bool
        @Published var leftOption: String?
        @Published var rightOption: String?
        
        var leftOptionDestination: OptionView?
        var rightOptionDestination: OptionView?
        
        init(text: String, showOptions: Bool, leftOptionString: String? = nil, rightOptionString: String? = nil, leftOptionDestination: OptionView? = nil, rightOptionDestination: OptionView? = nil) {
            self.text = text
            self.showOptions = showOptions
            self.leftOption = leftOption
            self.rightOption = rightOption
            self.leftOptionDestination = leftOptionDestination
            self.rightOptionDestination = rightOptionDestination
        }
    }
}