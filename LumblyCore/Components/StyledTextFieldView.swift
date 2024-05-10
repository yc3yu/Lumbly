//
//  StyledTextFieldView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct StyledTextFieldView: View {
    @StateObject var viewModel: StyledTextFieldViewModel
    
    var body: some View {
        Group {
            if viewModel.isSecureField {
                SecureField(viewModel.title, text: viewModel.$text)
            } else {
                TextField(viewModel.title, text: viewModel.$text, axis: .vertical)
            }
        }
        .textInputAutocapitalization(viewModel.autocapitalization)
        .autocorrectionDisabled(viewModel.autocorrectionDisabled)
        .padding(.all, .smallSpace)
        .background(viewModel.backgroundColor)
    }
}
