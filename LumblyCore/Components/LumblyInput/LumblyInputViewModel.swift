//
//  LumblyInputViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-17.
//

import SwiftUI

extension LumblyInputView {
    class ViewModel: ObservableObject {
        private(set) var buttonText: String
        private(set) var buttonDestination: DestinationView
        
        var styledTextFieldViewModels: [StyledTextFieldView.ViewModel]
        
        var buttonIsDisabled: Bool {
            let requiredTextFields = styledTextFieldViewModels.filter(\.isRequiredField).map(\.text)
            return requiredTextFields.contains(where: \.isEmpty)
        }
        
        init(styledTextFieldViewModels: [StyledTextFieldView.ViewModel],
             buttonText: String,
             buttonDestination: DestinationView) {
            self.styledTextFieldViewModels = styledTextFieldViewModels
            self.buttonText = buttonText
            self.buttonDestination = buttonDestination
        }
    }
}
