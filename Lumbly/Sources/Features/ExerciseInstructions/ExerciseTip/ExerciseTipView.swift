//
//  ExerciseTipView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct ExerciseTipView: View {
    private struct Constants {
        static let textAndImageSpacing: CGFloat = 12.0
        static let imageWidth: CGFloat = 286.0
        static let imageHeight: CGFloat = 148.0
        static let rectangleContentPadding: CGFloat = 12.0
        static let tileCornerRadius: CGFloat = 15.0
    }
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: Constants.textAndImageSpacing) {
            VStack(alignment: .leading, spacing: .miniSpace) {
                if let tipNumber = viewModel.tipNumber {
                    Text("\(L10n.ExerciseTipView.tipNumber)\(tipNumber)")
                        .font(.caption1Bold)
                        .foregroundColor(.resolutionBlue)
                }
                
                if let tipName = viewModel.exerciseTipData?.tipName {
                    Text(tipName)
                        .font(.title3Bold)
                }
                
                if let tipDescription = viewModel.exerciseTipData?.tipDescription {
                    Text(tipDescription)
                        .font(.bodyRegular)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let tipImage = viewModel.exerciseTipData?.tipImage {
                AsyncImage(url: URL(string: tipImage)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    } else if phase.error != nil {
                        ErrorLoadingContentView(errorText: L10n.ErrorLoadingContentView.contentError)
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    } else {
                        ProgressView()
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                    }
                }
            }
        }
        .padding(Constants.rectangleContentPadding)
        .background(
            RoundedRectangle(cornerRadius: Constants.tileCornerRadius, style: .continuous)
                .foregroundColor(.white)
        )
    }
}

struct ExerciseTipView_Previews: PreviewProvider {
    private struct Constants {
        static let tipImage = "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D"
        static let outerPadding: CGFloat = 12.0
    }
    
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea()
            
            VStack(spacing: .mediumSpace) {
                ExerciseTipView(viewModel:
                        .init(tipNumber: 1,
                              exerciseTipData:
                                .init(tipName: "Raise your leg to be level with your back",
                                      tipDescription: "You tend to raise your leg too high when doing this exercise. Make sure to raise your leg only as high as your back.",
                                      tipImage: Constants.tipImage)))
                
                ExerciseTipView(viewModel:
                        .init(tipNumber: 2,
                              exerciseTipData:
                                .init(tipName: "This is a tip with no description",
                                      tipImage: Constants.tipImage)))
                
                ExerciseTipView(viewModel:
                        .init(tipNumber: 3,
                              exerciseTipData:
                                .init(tipName: "This is a tip with no image",
                                      tipDescription: "You tend to raise your leg too high when doing this exercise. Make sure to raise your leg only as high as your back.")))
            }
            .padding(Constants.outerPadding)
        }
    }
}
