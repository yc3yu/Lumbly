//
//  StyledTextFieldView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct StyledTextFieldView: View {
    private var styledTitle: String {
        let suffix = viewModel.isRequiredField ? "*" : ""
        return viewModel.title + suffix
    }
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Group {
            if viewModel.isSecureField {
                SecureField(styledTitle, text: viewModel.$text)
            } else {
                TextField(styledTitle, text: viewModel.$text, axis: viewModel.axis)
            }
        }
        .textInputAutocapitalization(viewModel.autocapitalization)
        .autocorrectionDisabled(viewModel.autocorrectionDisabled)
        .padding(.all, .smallSpace)
        .background(viewModel.backgroundColor)
    }
}
