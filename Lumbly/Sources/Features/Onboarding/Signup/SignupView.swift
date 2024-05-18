//
//  SignupView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-21.
//

import SwiftUI

struct SignupView: View {
    @State var physiotherapistCode: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
            
    var body: some View {
        LumblyInputView(viewModel: .init(
            styledTextFieldViewModels: [
                .init(L10n.Onboarding.physiotherapistCode,
                      text: $physiotherapistCode,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.name,
                      text: $name,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.email,
                      text: $email,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.password,
                      text: $password,
                      autocorrectionDisabled: true,
                      isSecureField: true)
            ],
            buttonText: L10n.Onboarding.signUp,
            buttonDestination: HomeView()))
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
