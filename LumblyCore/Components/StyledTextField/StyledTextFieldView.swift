//
//  StyledTextFieldView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct StyledTextFieldView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Group {
            if viewModel.isSecureField {
                SecureField(viewModel.styledTitle, text: viewModel.$text)
            } else {
                TextField(viewModel.styledTitle, text: viewModel.$text, axis: viewModel.axis)
            }
        }
        .textInputAutocapitalization(viewModel.autocapitalization)
        .autocorrectionDisabled(viewModel.autocorrectionDisabled)
        .padding(.all, .smallSpace)
        .background(viewModel.backgroundColor)
    }
}
