//
//  ProfileView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-21.
//

import SwiftUI

struct ProfileView: View {
    private struct Constants {
        static let temporaryBodyText = "This will show information about the user's profile." // For demo purpoes, this view was not implemented
        static let vStackSpacing: CGFloat = 80.0
        static let topPadding: CGFloat = 40.0
    }
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.horizontal, .bottom])
            
            VStack(spacing: Constants.vStackSpacing) {
                Text(L10n.ProfileView.profile)
                    .font(.largeTitleBold)
                    .foregroundColor(.darkGray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Constants.topPadding)
                    .padding(.horizontal, .mediumSpace)
                
                Text(Constants.temporaryBodyText)
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
}
