//
//  ExerciseStepView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

struct ExerciseStepView: View {
    private struct Constants {
        static let numberWidth: CGFloat = 22.0
        static let imageWidth: CGFloat = 270.0
        static let imageHeight: CGFloat = 148.0
    }
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: .smallSpace) {
            HStack(alignment: .top, spacing: .miniSpace) {
                if let stepNumber = viewModel.exerciseStepData?.stepNumber {
                    Text("\(stepNumber).")
                    .frame(width: Constants.numberWidth, alignment: .trailing)
                }
                
                if let stepString = viewModel.exerciseStepData?.stepString {
                    Text(stepString)
                }
                
                Spacer()
            }
            .font(.bodyBold)
            .foregroundColor(.blueCharcoal)
            
            if let stepImage = viewModel.exerciseStepData?.stepImage,
               !stepImage.isEmpty {
                AsyncImage(url: URL(string: stepImage)) { phase in
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
    }
}

struct ExerciseStepView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.container)
            
            VStack(spacing: .mediumSpace) {
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 1, stepString: "This is the first instruction. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines.", stepImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D")))
                    
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 2, stepString: "This step has no image.")))
                
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 3, stepString: "This is the third instruction.", stepImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Bird%20Dog/Bird%20Dog.png?sv=2021-10-04&st=2023-02-26T23%3A08%3A29Z&se=2023-05-01T22%3A08%3A00Z&sr=b&sp=r&sig=JnApvY92bvlrHo49DB45zLaDK4kmWq9vaeS123uJ5hA%3D")))
            }.padding(.horizontal, .mediumSpace)
        }
    }
}
