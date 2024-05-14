//
//  ExerciseRatingTileView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

struct ExerciseRatingTileView: View {
    private struct Constants {
        static let textHeight: CGFloat = 18.48
        static let textImageSpacing: CGFloat = 12.0
        static let tileTopPadding: CGFloat = 11.48
        static let tileSidePadding: CGFloat = 12.0
        static let tileBottomPadding: CGFloat = 7.66
        static let tileCornerRadius: CGFloat = 10.0
        static let imageSize: CGFloat = 33.38
    }
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.tileCornerRadius)
                .foregroundColor(.veniceBlue)
            
            if let exerciseRating = viewModel.exerciseRating {
                VStack(spacing: Constants.textImageSpacing) {
                    Text(exerciseRating)
                        .font(.caption1Bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.sinbadBlue)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(height: Constants.textHeight, alignment: .center)
                    
                    Image(exerciseRating)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.imageSize, height: Constants.imageSize)
                    
                }
                .padding(.top, Constants.tileTopPadding)
                .padding(.horizontal, Constants.tileSidePadding)
                .padding(.bottom, Constants.tileBottomPadding)
            }
        }
    }
}

struct ExerciseRatingTileView_Previews: PreviewProvider {
    private struct Constants {
        static let tileWidth: CGFloat = 88.0
        static let tileHeight: CGFloat = 83.0
    }
    
    static var previews: some View {
        HStack {
            ExerciseRatingTileView(viewModel: .init(exerciseRating: L10n.ExerciseRatingTileView.likedIt))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
            
            ExerciseRatingTileView(viewModel: .init(exerciseRating: L10n.ExerciseRatingTileView.neutral))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
            
            ExerciseRatingTileView(viewModel: .init(exerciseRating: L10n.ExerciseRatingTileView.dislikedIt))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
        }
    }
}
