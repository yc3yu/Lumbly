//
//  LumblyInputView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-17.
//

import SwiftUI

struct LumblyInputView<DestinationView: View>: View {
    private struct Constants {
        let logoWidth: CGFloat = 282.0
        let logoHeight: CGFloat = 103.0
        let buttonWidth: CGFloat = 177.0
        let buttonHeight: CGFloat = 56.0
        let vStackSpacing: CGFloat = 40.0
        let horizontalPadding: CGFloat = 20.0
        let verticalPadding: CGFloat = 40.0
    }
    
    private let constants = Constants()

    @ObservedObject var viewModel: ViewModel

    @State private var showCompleteFieldsAlert: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.oysterBay
                    .ignoresSafeArea(.all)
                
                ScrollView {
                    ScrollViewReader { proxy in
                        VStack(spacing: constants.vStackSpacing) {
                            Image(asset: Asset.lumblyMedium)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: constants.logoWidth, height: constants.logoHeight)
                            
                            ForEach(viewModel.styledTextFieldViewModels, id: \.title) { styledTextFieldViewModel in
                                StyledTextFieldView(viewModel: styledTextFieldViewModel)
                                    .onTapGesture {
                                        withAnimation {
                                            proxy.scrollTo(styledTextFieldViewModel.title, anchor: .center)
                                        }
                                    }
                            }
                            
                            Group {
                                if viewModel.buttonIsDisabled {
                                    BlueButtonView(text: viewModel.buttonText,
                                                   backgroundColor: .lightSecondary) {
                                        showCompleteFieldsAlert = true
                                    }.alert(L10n.Onboarding.fillInAllRequiredFields, isPresented: $showCompleteFieldsAlert) {
                                        Button(L10n.ModalResponseOptions.ok, role: .cancel) {
                                            showCompleteFieldsAlert = false
                                        }
                                    }
                                } else {
                                    NavigationLink(destination: viewModel.buttonDestination) {
                                        BlueButtonView(text: viewModel.buttonText,
                                                       navLinkButton: true)
                                    }
                                }
                            }
                            .frame(width: constants.buttonWidth, height: constants.buttonHeight)
                            .padding(.bottom, constants.vStackSpacing)
                        }
                        .frame(minHeight: geometry.size.height, alignment: .center)
                        .padding(.horizontal, constants.horizontalPadding)
                    }
                }
            }
        }
    }
}
