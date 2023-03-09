//
//  FormCommentTileView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-26.
//

import SwiftUI

struct FormCommentTileView: View {
    private struct Constants {
        static let tileCornerRadius: CGFloat = 10.0
        static let mainImageBottomPadding: CGFloat = 40.0
        static let solutionBottomPadding: CGFloat = 12.0
        static let imageWidth: CGFloat = 294.0
        static let mainImageHeight: CGFloat = 156.0
        static let secondaryImageHeight: CGFloat = 148.0
    }
    
    @StateObject var viewModel: FormCommentTileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            if let commentTitle = viewModel.formCommentTileData?.commentTitle {
                Text(commentTitle)
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
            }
            
            if let mainImage = viewModel.formCommentTileData?.mainImage,
               !mainImage.isEmpty {
                AsyncImage(url: URL(string: mainImage)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.imageWidth, height: Constants.mainImageHeight)
                } placeholder: {
                    Color.clear
                        .frame(width: Constants.imageWidth, height: Constants.mainImageHeight)
                }
            }
            
            if let solution = viewModel.formCommentTileData?.solution,
               !solution.isEmpty {
                Text(L10n.FormCommentTileView.solution)
                    .font(.caption1Bold)
                    .foregroundColor(.resolutionBlue)
                    .padding(.top, Constants.mainImageBottomPadding)
                
                Text(solution)
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .padding(.bottom, Constants.solutionBottomPadding)
                
                if let secondaryImage = viewModel.formCommentTileData?.secondaryImage,
                   !secondaryImage.isEmpty {
                    AsyncImage(url: URL(string: secondaryImage)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Constants.imageWidth, height: Constants.secondaryImageHeight)
                    } placeholder: {
                        Color.clear
                            .frame(width: Constants.imageWidth, height: Constants.secondaryImageHeight)
                    }
                }
            }
        }
        .padding(.mediumSpace)
        .background(
            RoundedRectangle(cornerRadius: Constants.tileCornerRadius, style: .continuous)
                .foregroundColor(.white)
        )
    }
}

struct FormCommentTileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: .mediumSpace) {
                    FormCommentTileView(viewModel:
                            .init(formCommentTileData:
                                    .init(commentTitle: "Leg lifted too high",
                                          mainImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D",
                                          solution: "Remember to keep your leg lifted so it makes a straight line with your back.",
                                          secondaryImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D")))
                    
                    FormCommentTileView(viewModel:
                            .init(formCommentTileData:
                                    .init(commentTitle: "Good arm height",
                                          mainImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D")))
                }
                .padding(.mediumSpace)
            }
        }
    }
}
