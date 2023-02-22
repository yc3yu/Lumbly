//
//  OnboardingView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

struct OnboardingView: View {
    private struct Constants {
        static let lumblyLogoWidth: CGFloat = 335.0
        static let lumblyLogoHeight: CGFloat = 122.0
        static let logoToSignUpSpacing: CGFloat = 40.0
        static let buttonWidth: CGFloat = 177.0
    }
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: .zero) {
                Image("LumblyLarge")
                    .resizable()
                    .frame(width: Constants.lumblyLogoWidth, height: Constants.lumblyLogoHeight)
                    .padding(.bottom, Constants.logoToSignUpSpacing)
                
                NavigationLink(destination: SignupView()) {
                    BlueButtonView(text: L10n.OnboardingView.signUp,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth)
                    .padding(.bottom, .mediumSpace)
                }
                
                NavigationLink(destination: LoginView()) {
                    BlueButtonView(text: L10n.OnboardingView.logIn,
                                   textColor: .prussianBlue,
                                   backgroundColor: .oysterBay,
                                   borderColor: .resolutionBlue,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth)
                }
            }
        }.frame(maxHeight: .infinity)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
