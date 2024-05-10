//
//  StyledTextFieldViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-09.
//

import SwiftUI

extension StyledTextFieldView {
    class StyledTextFieldViewModel: ObservableObject {
        @Binding var text: String
        
        private(set) var title: String
        private(set) var autocapitalization: TextInputAutocapitalization
        private(set) var autocorrectionDisabled: Bool
        private(set) var backgroundColor: Color
        private(set) var isSecureField: Bool
        
        init(_ title: String = "",
             text: Binding<String>,
             autocapitalization: TextInputAutocapitalization = .never,
             autocorrectionDisabled: Bool = false,
             backgroundColor: Color = .white,
             isSecureField: Bool = false) {
            self.title = title
            self._text = text
            self.autocapitalization = autocapitalization
            self.autocorrectionDisabled = autocorrectionDisabled
            self.backgroundColor = backgroundColor
            self.isSecureField = isSecureField
        }
    }
}
