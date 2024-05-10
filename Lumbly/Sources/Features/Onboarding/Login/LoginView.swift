//
//  LoginView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2022-10-26.
//

import SwiftUI

struct LoginView: View {
    private struct Constants {
        static let logoWidth: CGFloat = 282.0
        static let logoHeight: CGFloat = 103.0
        static let fieldHeight: CGFloat = 56.0
        static let buttonWidth: CGFloat = 177.0
        static let buttonHeight: CGFloat = 56.0
        static let vStackSpacing: CGFloat = 40.0
        static let vStackHorizontalPadding: CGFloat = 20.0
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: Constants.vStackSpacing) {
                Image(asset: Asset.lumblyMedium)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.logoWidth, height: Constants.logoHeight)
                
                StyledTextFieldView(L10n.Onboarding.email,
                                    text: $email,
                                    autocorrectionDisabled: true)
                
                StyledTextFieldView(L10n.Onboarding.password,
                                    text: $password,
                                    autocorrectionDisabled: true,
                                    isSecureField: true)
                
                NavigationLink(destination: HomeView()) {
                    BlueButtonView(text: L10n.Onboarding.logIn,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                }.disabled(email.isEmpty || password.isEmpty)
            }.padding(.horizontal, Constants.vStackHorizontalPadding)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
