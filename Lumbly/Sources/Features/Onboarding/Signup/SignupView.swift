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
    
    private var styledTextFieldViewModels: [StyledTextFieldView.ViewModel] {
        return [.init(L10n.Onboarding.physiotherapistCode,
                      text: $physiotherapistCode,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.name,
                      text: $name,
                      isRequiredField: false,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.email,
                      text: $email,
                      autocorrectionDisabled: true),
                .init(L10n.Onboarding.password,
                      text: $password,
                      autocorrectionDisabled: true,
                      isSecureField: true)]
    }

    private var buttonIsDisabled: Bool {
        let requiredTextFields = styledTextFieldViewModels.filter(\.isRequiredField).map(\.text)
        return requiredTextFields.contains(where: \.isEmpty)
    }
    
    @State private var physiotherapistCode: String = ""
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showCompleteFieldsAlert: Bool = false
    
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
                    
                    ForEach(styledTextFieldViewModels, id: \.title) { styledTextFieldViewModel in
                        StyledTextFieldView(viewModel: styledTextFieldViewModel)
                    }
                    
                    Group {
                        if buttonIsDisabled {
                            BlueButtonView(text: L10n.Onboarding.signUp,
                                           backgroundColor: .lightSecondary) {
                                showCompleteFieldsAlert = true
                            }.alert(L10n.Onboarding.fillInAllRequiredFields, isPresented: $showCompleteFieldsAlert) {
                                Button(L10n.ModalResponseOptions.ok, role: .cancel) {
                                    showCompleteFieldsAlert = false
                                }
                            }
                        } else {
                            NavigationLink(destination: HomeView()) {
                                BlueButtonView(text: L10n.Onboarding.signUp,
                                               navLinkButton: true)
                            }
                        }
                    }
                    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                    .padding(.bottom, Constants.vStackSpacing)

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
