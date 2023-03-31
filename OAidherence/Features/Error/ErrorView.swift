//
//  ErrorView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-31.
//

import SwiftUI

struct ErrorView: View {
    private struct Constants {
        static let loadingIconSize: CGFloat = 87.0
    }
    
    var errorText: String?
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)

            Text(errorText ?? "")
                .font(.title2Bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.resolutionBlue)
                .padding(.mediumSpace)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: L10n.ResultsView.error)
    }
}

