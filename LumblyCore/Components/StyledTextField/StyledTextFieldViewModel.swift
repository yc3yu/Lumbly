//
//  StyledTextFieldViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-09.
//

import SwiftUI

extension StyledTextFieldView {
    class ViewModel: ObservableObject {
        @Binding var text: String
        
        private(set) var title: String
        private(set) var isRequiredField: Bool
        private(set) var autocapitalization: TextInputAutocapitalization
        private(set) var autocorrectionDisabled: Bool
        private(set) var backgroundColor: Color
        private(set) var axis: Axis
        private(set) var isSecureField: Bool
        
        init(_ title: String = "",
             text: Binding<String>,
             isRequiredField: Bool = true,
             autocapitalization: TextInputAutocapitalization = .never,
             autocorrectionDisabled: Bool = false,
             backgroundColor: Color = .white,
             axis: Axis = .horizontal,
             isSecureField: Bool = false) {
            self.title = title
            self._text = text
            self.isRequiredField = isRequiredField
            self.autocapitalization = autocapitalization
            self.autocorrectionDisabled = autocorrectionDisabled
            self.backgroundColor = backgroundColor
            self.axis = axis
            self.isSecureField = isSecureField
        }
    }
}
