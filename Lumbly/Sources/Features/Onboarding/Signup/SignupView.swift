//
//  SignupView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-21.
//

import SwiftUI

struct SignupView: View {
    private struct Constants {
        static let logoWidth: CGFloat = 282.0
        static let logoHeight: CGFloat = 103.0
        static let buttonWidth: CGFloat = 177.0
        static let buttonHeight: CGFloat = 56.0
        static let vStackSpacing: CGFloat = 40.0
        static let horizontalPadding: CGFloat = 20.0
        static let verticalPadding: CGFloat = 40.0
    }
    
    @State private var physiotherapistCode: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(spacing: Constants.vStackSpacing) {
                    Image(asset: Asset.lumblyMedium)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.logoWidth, height: Constants.logoHeight)
                    
                    StyledTextFieldView(viewModel:
                            .init(L10n.Onboarding.physiotherapistCode,
                                  text: $physiotherapistCode,
                                  autocorrectionDisabled: true))
                    
                    StyledTextFieldView(viewModel:
                            .init(L10n.Onboarding.name,
                                  text: $name,
                                  autocorrectionDisabled: true))
                    
                    StyledTextFieldView(viewModel:
                            .init(L10n.Onboarding.email,
                                  text: $email,
                                  autocorrectionDisabled: true))
                    
                    StyledTextFieldView(viewModel:
                            .init(L10n.Onboarding.password,
                                  text: $password,
                                  autocorrectionDisabled: true,
                                  isSecureField: true))
                    
                    NavigationLink(destination: HomeView()) {
                        BlueButtonView(text: L10n.Onboarding.signUp,
                                       navLinkButton: true)
                        .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                        .padding(.bottom, Constants.vStackSpacing)
                    }.disabled(physiotherapistCode.isEmpty ||
                               name.isEmpty ||
                               email.isEmpty ||
                               password.isEmpty)
                }
                .padding(.horizontal, Constants.horizontalPadding)
                .padding(.vertical, Constants.verticalPadding)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
