//
//  StyledTextFieldView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct StyledTextFieldView: View {
    @Binding var text: String
    
    var title: String
    var autocapitalization: TextInputAutocapitalization
    var autocorrectionDisabled: Bool
    var backgroundColor: Color
    var isSecureField: Bool
    
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
    
    var body: some View {
        Group {
            if isSecureField {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text, axis: .vertical)
            }
        }
        .textInputAutocapitalization(autocapitalization)
        .autocorrectionDisabled(autocorrectionDisabled)
        .padding(.all, .smallSpace)
        .background(backgroundColor)
    }
}
