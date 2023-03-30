//
//  ProfileView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.horizontal, .bottom])
            
            VStack(spacing: 80.0) {
                Text("Profile")
                    .font(.largeTitleBold)
                    .foregroundColor(.darkGray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40.0)
                    .padding(.horizontal, .mediumSpace)
                
                Text("This will show information about the user's profile.\n\n(This view is to be updated.)")
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
}
