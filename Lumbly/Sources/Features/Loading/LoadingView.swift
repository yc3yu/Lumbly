//
//  LoadingView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

struct LoadingView: View {
    private struct Constants {
        static let loadingIconSize: CGFloat = 87.0
    }
    
    var loadingText: String?
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: .largeSpace) {
                if let loadingText = loadingText,
                   !loadingText.isEmpty {
                    Text(loadingText)
                        .font(.title3Bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.resolutionBlue)
                }
                
                Image(asset: Asset.loading)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.loadingIconSize, height: Constants.loadingIconSize)
            }
            .padding(.mediumSpace)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loadingText: "Setting up your account...")
    }
}
