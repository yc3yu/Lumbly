//
//  StyledTextFieldView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct StyledTextFieldView: View {
    private struct Constants {
        static let fieldHeight: CGFloat = 56.0
    }
    
    var textFieldContent: AnyView
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
            
            VStack {
                textFieldContent
                
                Divider()
            }.padding(.horizontal, .smallSpace)
        }.frame(height: Constants.fieldHeight)
    }
}


struct TextFieldStylingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack {
                StyledTextFieldView(textFieldContent: AnyView(TextField("Email", text: .constant(""))))
                
                StyledTextFieldView(textFieldContent:
                                        AnyView(TextField(L10n.Onboarding.physiotherapistCode,
                                                          text: .constant(""))
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)))
            }
        }
    }
}
