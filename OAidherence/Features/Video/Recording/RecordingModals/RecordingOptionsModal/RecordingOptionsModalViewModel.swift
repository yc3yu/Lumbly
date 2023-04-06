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
        
        init(text: String, showOptions: Bool, leftOption: String? = nil, rightOption: String? = nil) {
            self.text = text
            self.showOptions = showOptions
            self.leftOption = leftOption
            self.rightOption = rightOption
        }
    }
}
