//
//  ExerciseSetTileView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct ExerciseSetTileView: View {
    private struct Constants {
        static let cornerRadius: CGFloat = 15.0
        static let topPadding: CGFloat = 28.0
    }
    
    @StateObject var viewModel: ExerciseSetTileViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(Color.veniceBlue)
            
            VStack(spacing: .zero) {
                VStack(spacing: .miniSpace) {
                    if let exerciseSetName = viewModel.exerciseSetTileData?.exerciseSetName {
                        Text(exerciseSetName)
                            .font(.bodyBold)
                            .foregroundColor(.sinbadBlue)
                    }
                   
                    if let duration = viewModel.exerciseSetTileData?.duration {
                        Text(duration)
                            .font(.bodyRegular)
                            .foregroundColor(.sinbadBlue)
                    }
                }
                .padding(.bottom, .mediumSpace)
                
                Divider()
                    .overlay(Color.sinbadBlue)
                    .padding(.bottom, .smallSpace)
                
                Text(L10n.ExerciseSetTileView.start)
                    .font(.title3Bold)
                    .foregroundColor(.sinbadBlue)
                
                Spacer()
            }
            .padding(.top, Constants.topPadding)
            .padding(.horizontal, .miniSpace)
        }
    }
}

struct ExerciseSetTileView_Previews: PreviewProvider {
    private struct Constants {
        static let tileWidth: CGFloat = 272
        static let tileHeight: CGFloat = 158
    }
    
    static var previews: some View {
        ExerciseSetTileView(viewModel:
                .init(exerciseSetTileData:
                        .init(exerciseSetName: "Lower Back Exercises",
                              duration: "5 min")))
        .frame(width: Constants.tileWidth, height: Constants.tileHeight)
    }
}
