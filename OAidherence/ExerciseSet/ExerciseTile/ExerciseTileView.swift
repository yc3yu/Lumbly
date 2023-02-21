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
                        if let inlineIcon = viewModel.exerciseTileData?.inlineIcon {
                            AsyncImage(url: URL(string: inlineIcon))
                                .frame(width: .mediumSpace, height: .mediumSpace)
                        }
                        
                        if let exerciseName = viewModel.exerciseTileData?.exerciseName {
                            Text(exerciseName)
                                .font(.title3Bold)
                        }
                    }
                    
                    if let reps = viewModel.exerciseTileData?.reps {
                        Text(reps)
                            .font(.caption1Bold)
                    }
                }
                
                if let exerciseImage = viewModel.exerciseTileData?.exerciseImage {
                    AsyncImage(url: URL(string: exerciseImage))
                        .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight)
                }
            }
        }.onAppear(perform: viewModel.fetchData)
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
