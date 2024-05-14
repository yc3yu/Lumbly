//
//  PainLevelTileView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-28.
//

import SwiftUI

struct PainLevelTileView: View {
    private struct Constants {
        static let textHeight: CGFloat = 28.2
        static let textImageSpacing: CGFloat = 10.24
        static let tileTopPadding: CGFloat = 14.56
        static let tileSidePadding: CGFloat = 12.0
        static let tileBottomPadding: CGFloat = 13.0
        static let tileCornerRadius: CGFloat = 10.0
        static let faceSize: CGFloat = 28.0
    }
    
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.tileCornerRadius)
                .foregroundColor(.veniceBlue)
            
            if let painLevel = viewModel.painLevel {
                VStack(spacing: Constants.textImageSpacing) {
                    Text(painLevel)
                        .font(.caption1Bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.sinbadBlue)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(height: Constants.textHeight, alignment: .center)
                    
                    Image(painLevel)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.faceSize, height: Constants.faceSize)
                    
                }
                .padding(.top, Constants.tileTopPadding)
                .padding(.horizontal, Constants.tileSidePadding)
                .padding(.bottom, Constants.tileBottomPadding)
            }
        }
    }
}

struct PainLevelTileView_Previews: PreviewProvider {
    private struct Constants {
        static let tileWidth: CGFloat = 87.0
        static let tileHeight: CGFloat = 94.0
    }
    
    static var previews: some View {
        HStack {
            PainLevelTileView(viewModel: .init(painLevel: "No pain"))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
            
            PainLevelTileView(viewModel: .init(painLevel: "Hurts a little more"))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
        }
    }
}
