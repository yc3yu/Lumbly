//
//  BlueButtonView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-21.
//

import SwiftUI

struct BlueButtonView: View {
    private struct Constants {
        static let height: CGFloat = 50.0
        static let cornerRadius: CGFloat = 15.0
        static let borderWidth: CGFloat = 3.0
    }
    
    var text: String
    var textColor: Color?
    var backgroundColor: Color?
    var borderColor: Color?
    var action: () -> ()
    
    var body: some View {
        Button(action: action) {
                Text(text)
                    .font(.title3Bold)
                    .foregroundColor(textColor ?? .mercuryGrey)
        }
        .frame(height: Constants.height, alignment: .center)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(backgroundColor ?? .resolutionBlue)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .strokeBorder(borderColor ?? .clear, lineWidth: Constants.borderWidth)
        )
    }
}

struct BlueButtonView_Previews: PreviewProvider {
    private struct Constants {
        static let wideWidth: CGFloat = 366.0
        
        static let narrowWidth: CGFloat = 177.0
    }
    
    static var previews: some View {
        VStack {
            BlueButtonView(text: L10n.ExerciseSetView.startExerciseSet,
                           backgroundColor: .veniceBlue,
                           borderColor: .blueCharcoal,
                           action: { })
            
            BlueButtonView(text: L10n.ExerciseSetView.startExerciseSet,
                           backgroundColor: .veniceBlue,
                           action: { })
            .frame(width: Constants.wideWidth)
            
            BlueButtonView(text: "Sign up",
                           action: { })
            .frame(width: Constants.narrowWidth)
            
            BlueButtonView(text: "Log in",
                           textColor: .prussianBlue,
                           backgroundColor: .white,
                           borderColor: .resolutionBlue,
                           action: { })
            .frame(width: Constants.narrowWidth)
        }
    }
}
