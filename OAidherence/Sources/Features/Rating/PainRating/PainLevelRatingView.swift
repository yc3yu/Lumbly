//
//  PainLevelRatingView.swift
//  Lumbly
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
    
    @StateObject var viewModel: PainLevelRatingViewModel
    
    var body: some View {
        // TODO: Change to navigate to exercise rating view
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
                        NavigationLink(destination: ResultsView(viewModel: .init(recordingViewModel: viewModel.recordingViewModel))) {
                            PainLevelTileView(viewModel: .init(painLevel: ratingOption))
                        } // TODO: Save user's selection to server with URL based on information in recordingViewModel
                    }
                }
            }
            .padding(.mediumSpace)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(destination: ResultsView(viewModel: .init(recordingViewModel: viewModel.recordingViewModel))) {
            Text(L10n.NavigationBarItem.skip)
        })
    }
}

struct PainLevelRatingView_Previews: PreviewProvider {
    static var previews: some View {
        PainLevelRatingView(viewModel:
                .init(recordingViewModel:
                        .init(parentExerciseSet: "",
                              exerciseName: "",
                              timestamp: "")))
    }
}
