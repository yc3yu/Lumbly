//
//  ExerciseTileView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-19.
//

import SwiftUI

struct ExerciseTileView: View {
    private struct Constants {
        static let tileCornerRadius: CGFloat = 15.0
        static let tileWidth: CGFloat = 344.0
        static let tileHeight: CGFloat = 160.0
        static let exerciseImageWidth: CGFloat = 130.0
        static let exerciseImageHeight: CGFloat = 78.0
    }
    
    @StateObject private var viewModel = ExerciseTileViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                .foregroundColor(.white)
                .cornerRadius(Constants.tileCornerRadius)
            
            HStack(spacing: .mediumSpace) {
                VStack(alignment: .leading) {
                    HStack {
                        // TODO: Remove this placeholder image once API server part works
                        Image("Physiotherapy")
                            .resizable()
                            .frame(width: .mediumSpace, height: .mediumSpace)
                        
                        // TODO: Remove this placeholder image once API server part works
                        Text("Bird Dog")
                            .font(.title3Bold)
                    }
                    
                    Text("10 Repetitions (per side)")
                        .font(.caption1Bold)
                }
                
                // TODO: Remove this placeholder image once API server part works
                Image("Placeholder")
                    .resizable()
                    .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight, alignment: .center)
                
                if let exerciseImage = viewModel.exerciseTileData?.exerciseImage {
                    AsyncImage(url: URL(string: exerciseImage),
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight, alignment: .center)
                    },
                    placeholder: {
                        Image("Placeholder")
                            .resizable()
                            .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight, alignment: .center)
                            .padding(.bottom, .smallSpace)
                    })
                    
                }
            }
        }
    }
}

struct ExerciseTileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.oysterBay)
            
            VStack {
                ExerciseTileView()
                    .padding(.mediumSpace)
                
                Spacer()
            }
        }
    }
}
