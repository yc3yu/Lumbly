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
    
    @StateObject var viewModel: ExerciseTileViewModel
    
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
        }
    }
}

struct ExerciseTileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.oysterBay)
            
            VStack {
                ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                    inlineIcon: "https://cs210032000a530a4b5.blob.core.windows.net/lumblyimage/Physiotherapy.png?sv=2021-10-04&st=2023-02-20T05%3A11%3A41Z&se=2023-02-21T05%3A11%3A41Z&sr=b&sp=r&sig=JU9hfpsfpyvRcz2nBv0QN%2FRv6ItBzqOze61IwY80lls%3D",
                    exerciseName: "Bird Dog",
                    reps: "10 Repetitions (per side)",
                    exerciseImage: "https://cs210032000a530a4b5.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-20T05%3A12%3A06Z&se=2023-02-21T05%3A12%3A06Z&sr=b&sp=r&sig=%2FzlHkdkS8dbdiP46jBFvx3KRasY8mOFuNmGVvuBBmfI%3D")))
                .padding(.mediumSpace)
                
                Spacer()
            }
        }
    }
}
