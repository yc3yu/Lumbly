//
//  LoginView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2022-10-26.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        LumblyInputView(viewModel: .init(
            styledTextFieldViewModels: [
                .init(L10n.Onboarding.email,
                      text: $email,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.password,
                      text: $password,
                      autocorrectionDisabled: true,
                      isSecureField: true)
            ],
            buttonText: L10n.Onboarding.logIn,
            buttonDestination: HomeView()))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
