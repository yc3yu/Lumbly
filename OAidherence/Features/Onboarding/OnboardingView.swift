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
        static let buttonHeight: CGFloat = 56.0
    }
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: .zero) {
                Image("LumblyLarge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.lumblyLogoWidth, height: Constants.lumblyLogoHeight)
                    .padding(.bottom, Constants.logoToSignUpSpacing)
                
                NavigationLink(destination: SignupView()) {
                    BlueButtonView(text: L10n.Onboarding.signUp,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                    .padding(.bottom, .mediumSpace)
                }
                
                NavigationLink(destination: LoginView()) {
                    BlueButtonView(text: L10n.Onboarding.logIn,
                                   textColor: .prussianBlue,
                                   backgroundColor: .oysterBay,
                                   borderColor: .resolutionBlue,
                                   navLinkButton: true)
                    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
