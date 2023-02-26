//
//  ExerciseStepView.swift
//  OAidherence
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
    
    @StateObject var viewModel: ExerciseStepViewModel
    
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
            
            if let stepImage = viewModel.exerciseStepData?.stepImage,
               !stepImage.isEmpty {
                AsyncImage(url: URL(string: stepImage)) { image in
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

struct ExerciseStepView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.container)
            
            VStack(spacing: .mediumSpace) {
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 1, stepString: "This is the first instruction. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines. It takes up multiple lines.", stepImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                    
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 2, stepString: "This step has no image.")))
                
                ExerciseStepView(viewModel: .init(exerciseStepData: ExerciseStep(stepNumber: 3, stepString: "This is the third instruction.", stepImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
            }.padding(.horizontal, .mediumSpace)
        }
    }
}
