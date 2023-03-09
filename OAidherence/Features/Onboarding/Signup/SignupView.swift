//
//  SignupView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-21.
//

import SwiftUI

struct SignupView: View {
    private struct Constants {
        static let logoWidth: CGFloat = 282.0
        static let logoHeight: CGFloat = 103.0
        static let fieldHeight: CGFloat = 56.0
        static let buttonWidth: CGFloat = 177.0
        static let buttonHeight: CGFloat = 56.0
        static let vStackSpacing: CGFloat = 40.0
        static let vStackHorizontalPadding: CGFloat = 20.0
    }
    
    @State private var physiotherapistCode: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: Constants.vStackSpacing) {
                Image("LumblyMedium")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.logoWidth, height: Constants.logoHeight)
                
                StyledTextFieldView(textFieldContent:
                                        AnyView(TextField(L10n.Onboarding.physiotherapistCode,
                                                          text: $physiotherapistCode)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)))
                
                StyledTextFieldView(textFieldContent:
                                        AnyView(TextField(L10n.Onboarding.name,
                                                          text: $name)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)))
                
                StyledTextFieldView(textFieldContent:
                                        AnyView(TextField(L10n.Onboarding.email,
                                                          text: $email)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)))
                
                StyledTextFieldView(textFieldContent:
                                        AnyView(SecureField(L10n.Onboarding.password,
                                                            text: $password)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)))
                
                NavigationLink(destination: HomeView()) {
                    BlueButtonView(text: L10n.Onboarding.signUp,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                }.disabled(physiotherapistCode.isEmpty ||
                           name.isEmpty ||
                           email.isEmpty ||
                           password.isEmpty)
            }.padding(.horizontal, Constants.vStackHorizontalPadding)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
