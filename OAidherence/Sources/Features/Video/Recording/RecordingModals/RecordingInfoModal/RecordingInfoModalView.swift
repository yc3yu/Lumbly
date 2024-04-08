//
//  RecordingInfoModalView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-04-03.
//

import SwiftUI

struct RecordingInfoModalView<DestinationView: View>: View {
    private struct Constants {
        let infoIconSize: CGFloat = 24.0
        let cornerRadius: CGFloat = 10.0
        let backgroundOpacity: CGFloat = 0.8
        let maxBodyTextWidth: CGFloat = 170.0
        let minRectangleHeight: CGFloat = 60.0
    }

    private let constants = Constants()

    @State var bodyTextSize: CGSize = .zero

    @State var viewModel: RecordingInfoModalViewModel
    
    var body: some View {
        VStack(spacing: .nanoSpace) {
            HStack(spacing: .zero) {
                Text(viewModel.exerciseName)
                    .font(.title2Bold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, .miniSpace)
                
                NavigationLink(destination: viewModel.infoNavLinkDestination) {
                    Image("InfoIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: constants.infoIconSize, height: constants.infoIconSize)
                }
                
                Spacer()
            }
            .padding(.trailing, .miniSpace)
            
            Group {
                if viewModel.isTestRun {
                    Text(L10n.RecordingInfoModalView.testRun)
                } else if let bodyText = viewModel.bodyText,
                          !bodyText.isEmpty {
                    Text(bodyText)
                }
            }
            .font(.bodyRegular)
            .foregroundColor(.veniceBlue)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.trailing, .littleSpace)
            .frame(maxWidth: constants.maxBodyTextWidth, alignment: .leading)
            .saveSize(in: $bodyTextSize)
        }
        .padding(.vertical)
        .padding(.leading, .littleSpace)
        .frame(height: bodyTextSize.height + constants.minRectangleHeight, alignment: .top)
        .fixedSize()
        .background(
            RoundedRectangle(cornerRadius: constants.cornerRadius, style: .continuous)
                .fill(Color.white.opacity(constants.backgroundOpacity))
        )
    }
}

struct RecordingInfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack {
                RecordingInfoModalView(viewModel:
                        .init(exerciseName: "Bird Dog",
                              isTestRun: true,
                              infoNavLinkDestination: ExerciseInstructionsView(viewModel:
                                    .init(parentExerciseSet: "Lower Back Exercises",
                                          exerciseNumber: 1,
                                          exerciseInstructionsURL: "",
                                          isTestRun: true))))
                
                RecordingInfoModalView(viewModel:
                        .init(exerciseName: "Bird Dog",
                              bodyText: "",
                              isTestRun: false,
                              infoNavLinkDestination: ExerciseInstructionsView(viewModel:
                                    .init(parentExerciseSet: "Lower Back Exercises",
                                          exerciseNumber: 1,
                                          exerciseInstructionsURL: "",
                                          isTestRun: true))))
                
                RecordingInfoModalView(viewModel:
                        .init(exerciseName: "Bird Dog",
                              bodyText: "10 Repetitions",
                              isTestRun: false,
                              infoNavLinkDestination: ExerciseInstructionsView(viewModel:
                                    .init(parentExerciseSet: "Lower Back Exercises",
                                          exerciseNumber: 1,
                                          exerciseInstructionsURL: "",
                                          isTestRun: true))))
                
                RecordingInfoModalView(viewModel:
                        .init(exerciseName: "Bird Dog",
                              bodyText: "10 Repetitions\n(per side)",
                              isTestRun: false,
                              infoNavLinkDestination: ExerciseInstructionsView(viewModel:
                                    .init(parentExerciseSet: "Lower Back Exercises",
                                          exerciseNumber: 1,
                                          exerciseInstructionsURL: "",
                                          isTestRun: true))))
                
                RecordingInfoModalView(viewModel:
                        .init(exerciseName: "Bird Dog",
                              bodyText: "10 Repetitions (per side) this is a very long string",
                              isTestRun: false,
                              infoNavLinkDestination: ExerciseInstructionsView(viewModel:
                                    .init(parentExerciseSet: "Lower Back Exercises",
                                          exerciseNumber: 1,
                                          exerciseInstructionsURL: "",
                                          isTestRun: true))))
            }
            .padding(.horizontal, .littleSpace)
        }
    }
}
