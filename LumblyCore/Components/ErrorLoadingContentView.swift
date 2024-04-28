//
//  ErrorLoadingContentView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-27.
//

import SwiftUI

struct ErrorLoadingContentView: View {
    private(set) var errorText: String
    
    var body: some View {
        Text(errorText)
            .multilineTextAlignment(.center)
            .font(.bodyRegular)
            .foregroundStyle(Color.darkGray03)
            .padding(.littleSpace)
    }
}

struct ErrorLoadingContentView_Previews: PreviewProvider {
    private struct Constants {
        static let frameWidth: CGFloat = 286.0
        static let frameHeight: CGFloat = 148.0
    }
    
    static var previews: some View {
        VStack(spacing: .mediumSpace) {
            ErrorLoadingContentView(errorText: "Oops! This content could not be loaded.")
                .frame(width: Constants.frameWidth, height: Constants.frameHeight)
            
            ErrorLoadingContentView(errorText: "View with no frame")
                .padding(.horizontal, .littleSpace)
        }
    }
}
