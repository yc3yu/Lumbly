//
//  ExerciseSetView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

struct ExerciseSetView: View {
    private struct Constants {
        static let topPadding: CGFloat = 40.0
        static let startButtonWidth: CGFloat = 366.0
        static let startButtonHeight: CGFloat = 50.0
        static let startButtonCornerRadius: CGFloat = 15.0
        static let bottomPadding: CGFloat = 80.0
    }
    
    @StateObject var viewModel: ExerciseSetViewModel
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            
            VStack(alignment: .leading, spacing: .mediumSpace) {
                VStack(alignment: .leading, spacing: .nanoSpace) {
                    if let name = viewModel.exerciseSetData?.name {
                        Text(name)
                            .font(.largeTitleBold)
                            .foregroundColor(.blueCharcoal)
                    }
                    
                    if let duration = viewModel.exerciseSetData?.duration {
                        Text(duration)
                            .font(.title3Regular)
                            .foregroundColor(.darkGray06)
                    }
                }
                
                HStack {
                    if let physiotherapyIcon = viewModel.exerciseSetData?.physiotherapyIcon {
                        AsyncImage(url: URL(string: physiotherapyIcon)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: .mediumSpace, height: .mediumSpace)
                        } placeholder: {
                            Color.clear
                                .frame(width: .mediumSpace, height: .mediumSpace)
                        }
                    }
                    
                    if let physiotherapyString = viewModel.exerciseSetData?.physiotherapyString {
                        Text(physiotherapyString)
                            .foregroundColor(.veniceBlue)
                    }
                }
                
                Divider()
                
                if let exerciseTiles = viewModel.exerciseSetData?.exerciseTiles,
                   exerciseTiles.count > 0,
                   let name = viewModel.exerciseSetData?.name {
                    ScrollView(showsIndicators: false) {
                        ForEach(exerciseTiles.indices, id: \.self) { i in
                            NavigationLink(destination:
                                            ExerciseInstructionsView(viewModel:
                                                    .init(parentExerciseSet: name,
                                                          exerciseNumber: i + 1,
                                                          exerciseInstructionsURL: exerciseTiles[i].exerciseInstructionsURL,
                                                          isTestRun: true))) {
                                ExerciseTileView(viewModel:
                                        .init(exerciseTileData:
                                                ExerciseTile(inlineIcon: exerciseTiles[i].inlineIcon,
                                                             exerciseName: exerciseTiles[i].exerciseName,
                                                             repetitions: exerciseTiles[i].repetitions,
                                                             exerciseImage: exerciseTiles[i].exerciseImage)))
                            }.buttonStyle(.plain)
                        }
                    }
                    
                    Spacer(minLength: Constants.bottomPadding)
                } else if !viewModel.isLoading {
                    Text(L10n.ExerciseSetView.noExercises)
                        .font(.bodyBold)
                        .foregroundColor(.blueCharcoal)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, Constants.topPadding)
                    
                    Spacer()
                }
            }
            .padding(.top, Constants.topPadding)
            .padding(.horizontal, .mediumSpace)
            .ignoresSafeArea(edges: .bottom)
            
            if let exerciseTiles = viewModel.exerciseSetData?.exerciseTiles,
               exerciseTiles.count > 0,
               let exerciseInstructionsURL = viewModel.exerciseSetData?.exerciseTiles?[0].exerciseInstructionsURL,
               let name = viewModel.exerciseSetData?.name {
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: ExerciseInstructionsView(viewModel:
                            .init(parentExerciseSet: name,
                                  exerciseNumber: 1,
                                  exerciseInstructionsURL: exerciseInstructionsURL,
                                  showReadyButton: true,
                                  isTestRun: true))) {
                        BlueButtonView(text: L10n.ExerciseSetView.startExerciseSet, backgroundColor: .veniceBlue, navLinkButton: true)
                            .frame(width: Constants.startButtonWidth, height: Constants.startButtonHeight)
                    }
                }
            }
        }
        .onAppear(perform: viewModel.fetchData)
    }
}

struct ExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSetView(viewModel: .init(exerciseSetURL: nil))
    }
}
