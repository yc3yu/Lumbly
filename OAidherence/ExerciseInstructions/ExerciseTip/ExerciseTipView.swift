//
//  ExerciseTipView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct ExerciseTipView: View {
    private struct Constants {
        static let textWidth: CGFloat = 278.0
        static let textAndImageSpacing: CGFloat = 12.0
        static let imageWidth: CGFloat = 286.0
        static let imageHeight: CGFloat = 148.0
    }
    
    @StateObject var viewModel: ExerciseTipViewModel
    
    var body: some View {
        VStack(spacing: Constants.textAndImageSpacing) {
            VStack(alignment: .leading, spacing: .miniSpace) {
                if let tipName = viewModel.exerciseTipData?.tipName {
                    Text(tipName)
                        .font(.bodyBold)
                }
                
                if let tipDescription = viewModel.exerciseTipData?.tipDescription {
                    Text(tipDescription)
                        .font(.caption1Regular)
                }
            }
            .frame(width: Constants.textWidth, alignment: .leading)
            
            if let tipImage = viewModel.exerciseTipData?.tipImage {
                AsyncImage(url: URL(string: tipImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                } placeholder: {
                    Color.clear
                        .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                }
            }
        }
    }
}

struct ExerciseTipView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea()
            
            VStack(spacing: .mediumSpace) {
                ExerciseTipView(viewModel:
                        .init(exerciseTipData:
                                .init(tipName: "Raise your leg to be level with your back",
                                      tipDescription: "You tend to raise your leg too high when doing this exercise. Make sure to raise your leg only as high as your back.",
                                      tipImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                
                ExerciseTipView(viewModel:
                        .init(exerciseTipData:
                                .init(tipName: "This is a tip with no description",
                                      tipImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                
                ExerciseTipView(viewModel:
                        .init(exerciseTipData:
                                .init(tipName: "This is a tip with no image",
                                      tipDescription: "You tend to raise your leg too high when doing this exercise. Make sure to raise your leg only as high as your back.")))
            }
        }
    }
}
