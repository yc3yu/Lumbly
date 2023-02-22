//
//  LoginView.swift
//  OAidherence
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
                Image("LumblyMedium")
                    .resizable()
                    .frame(width: Constants.logoWidth, height: Constants.logoHeight)
                
                ZStack {
                    Rectangle()
                        .fill(.white)
                    
                    VStack {
                        TextField(L10n.Onboarding.email, text: $email)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                        
                        Divider()
                    }.padding(.horizontal, .smallSpace)
                }.frame(height: Constants.fieldHeight)
                
                ZStack {
                    Rectangle()
                        .fill(.white)
                    
                    VStack {
                        SecureField(L10n.Onboarding.password, text: $password)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                        
                        Divider()
                    }.padding(.horizontal, .smallSpace)
                }.frame(height: Constants.fieldHeight)
                
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