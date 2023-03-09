//
//  PainLevelRatingView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

struct PainLevelRatingView: View {
    private struct Constants {
        static let headerTilesPadding: CGFloat = 18.0
        static let tileWidth: CGFloat = 87.0
    }
    
    private let layout = [GridItem(.fixed(Constants.tileWidth), spacing: .mediumSpace),
                          GridItem(.fixed(Constants.tileWidth), spacing: .mediumSpace),
                          GridItem(.fixed(Constants.tileWidth), spacing: .mediumSpace)]
    
    @StateObject var viewModel = PainLevelRatingViewModel()
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.leading, .trailing, .bottom])

            VStack(spacing: Constants.headerTilesPadding) {
                HStack {
                    Text(L10n.PainLevelRatingView.rateYourBackPain)
                        .font(.title2Bold)
                        .foregroundColor(.blueCharcoal)
                    
                    Spacer()
                }
                
                LazyVGrid(columns: layout, spacing: .mediumSpace) {
                    ForEach(viewModel.painLevelOptions, id: \.self) { ratingOption in
                        PainLevelTileView(viewModel: .init(painLevel: ratingOption))
                    }
                }
            }
            .padding(.mediumSpace)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(destination: HomeView()) {
            Text(L10n.NavigationBarItem.skip)
        })
    }
}

struct PainLevelRatingView_Previews: PreviewProvider {
    static var previews: some View {
        PainLevelRatingView()
    }
}
