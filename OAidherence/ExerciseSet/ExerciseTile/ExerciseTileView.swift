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
            RoundedRectangle(cornerRadius: Constants.tileCornerRadius)
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                .foregroundColor(.white)
            
            HStack(spacing: .nanoSpace) {
                VStack(alignment: .leading) {
                    HStack {
                        if let inlineIcon = viewModel.exerciseTileData?.inlineIcon {
                            AsyncImage(url: URL(string: inlineIcon)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: .mediumSpace, height: .mediumSpace)
                            } placeholder: {
                                Color.clear
                                    .frame(width: .mediumSpace, height: .mediumSpace)
                            }
                        }
                        
                        if let exerciseName = viewModel.exerciseTileData?.exerciseName {
                            Text(exerciseName)
                                .font(.title3Bold)
                        }
                    }
                    
                    if let repetitions = viewModel.exerciseTileData?.repetitions {
                        Text(repetitions)
                            .font(.caption1Bold)
                            .foregroundColor(.darkGray03)
                    }
                }
                
                Spacer()
                
                if let exerciseImage = viewModel.exerciseTileData?.exerciseImage {
                    AsyncImage(url: URL(string: exerciseImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight)
                    } placeholder: {
                        Color.clear
                            .frame(width: Constants.exerciseImageWidth, height: Constants.exerciseImageHeight)
                    }
                }
            }
            .padding(.mediumSpace)
        }
    }
}

struct ExerciseTileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
            
            VStack(spacing: .mediumSpace) {
                ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                    inlineIcon: "https://templumblygroup.blob.core.windows.net/lumblyimage/Physiotherapy.png?sv=2021-10-04&st=2023-02-21T04%3A14%3A20Z&se=2023-05-02T03%3A14%3A00Z&sr=b&sp=r&sig=wRkRNDHXQxlZ3QA%2BWFnCGLpMdBvROF0vDp64lO9S57I%3D",
                    exerciseName: "Bird Dog",
                    repetitions: "10 Repetitions (per side)",
                    exerciseImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                
                ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                    inlineIcon: "https://templumblygroup.blob.core.windows.net/lumblyimage/Physiotherapy.png?sv=2021-10-04&st=2023-02-21T04%3A14%3A20Z&se=2023-05-02T03%3A14%3A00Z&sr=b&sp=r&sig=wRkRNDHXQxlZ3QA%2BWFnCGLpMdBvROF0vDp64lO9S57I%3D",
                    exerciseName: "Cat Cow",
                    repetitions: "10 Repetitions",
                    exerciseImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                
                Spacer()
            }
            .padding(.mediumSpace)
        }
    }
}
