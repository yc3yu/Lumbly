//
//  ExerciseInstructionsView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-25.
//

import SwiftUI

struct ExerciseInstructionsView: View {
    private struct Constants {
        static let topPadding: CGFloat = 40.0
        static let mainImageWidth: CGFloat = 310.0
        static let mainImageHeight: CGFloat = 173.0
        static let readyButtonWidth: CGFloat = 366.0
        static let readyButtonHeight: CGFloat = 50.0
        static let readyButtonCornerRadius: CGFloat = 15.0
        static let bottomPadding: CGFloat = 50.0
    }
    
    @State private var stepsOrTips = L10n.ExerciseInstructionsView.steps

    @StateObject var viewModel: ExerciseInstructionsViewModel

    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            
            if let exerciseName = viewModel.exerciseInstructionsData?.exerciseName,
               !exerciseName.isEmpty {
                ScrollView {
                    VStack(spacing: .mediumSpace) {
                        HStack {
                            VStack(alignment: .leading, spacing: .nanoSpace) {
                                Text("\(L10n.ExerciseInstructionsView.exercise) \(viewModel.exerciseNumber)")
                                    .font(.bodyBold)
                                    .foregroundColor(.darkGray06)
                                
                                if let exerciseName = viewModel.exerciseInstructionsData?.exerciseName {
                                    Text(exerciseName)
                                        .font(.largeTitleBold)
                                        .foregroundColor(.blueCharcoal)
                                }
                                
                                if let repetitions = viewModel.exerciseInstructionsData?.repetitions {
                                    Text(repetitions)
                                        .font(.caption1Regular)
                                        .foregroundColor(.darkGray06)
                                }
                            }
                            
                            Spacer()
                        }
                        
                        if let mainImage = viewModel.exerciseInstructionsData?.mainImage {
                            AsyncImage(url: URL(string: mainImage)) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Constants.mainImageWidth, height: Constants.mainImageHeight)
                            } placeholder: {
                                Color.clear
                                    .frame(width: Constants.mainImageWidth, height: Constants.mainImageHeight)
                            }
                        }
                        
                        Picker(L10n.ExerciseInstructionsView.stepsOrTips, selection: $stepsOrTips) {
                            Text(L10n.ExerciseInstructionsView.steps)
                                .tag(L10n.ExerciseInstructionsView.steps)
                            Text(L10n.ExerciseInstructionsView.tips)
                                .tag(L10n.ExerciseInstructionsView.tips)
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, .hugeSpace)
                        
                        if stepsOrTips == L10n.ExerciseInstructionsView.steps {
                            if let exerciseSteps = viewModel.exerciseInstructionsData?.exerciseSteps {
                                ForEach(exerciseSteps, id: \.self) { exerciseStep in
                                    ExerciseStepView(viewModel: .init(exerciseStepData: exerciseStep))
                                }
                            }
                        } else {
                            if let exerciseTips = viewModel.exerciseInstructionsData?.exerciseTips {
                                ForEach(exerciseTips, id: \.self) { exerciseTip in
                                    ExerciseTipView(viewModel: .init(exerciseTipData: exerciseTip))
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, Constants.topPadding)
                    .padding(.horizontal, .mediumSpace)
                    .padding(.bottom, Constants.bottomPadding)
                }

                if viewModel.showReadyButton {
                    VStack {
                        Spacer()
                        
                        NavigationLink(destination: RecordingView(exerciseName: exerciseName)) {
                            BlueButtonView(text: L10n.ExerciseInstructionsView.ready, navLinkButton: true)
                                .frame(width: Constants.readyButtonWidth, height: Constants.readyButtonHeight, alignment: .bottom)
                        }
                    }
                }
            } else if !viewModel.isLoading {
                Text(L10n.ExerciseInstructionsView.noInstructions)
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .onAppear(perform: viewModel.fetchData)
    }
}

struct ExerciseInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseInstructionsView(viewModel: .init(exerciseNumber: 1, exerciseInstructionsURL: nil))
    }
}
