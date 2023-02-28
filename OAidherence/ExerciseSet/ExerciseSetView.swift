//
//  ExerciseSetView.swift
//  OAidherence
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
        static let bottomPadding: CGFloat = 50.0
    }
    
    @StateObject var viewModel: ExerciseSetViewModel
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: .mediumSpace) {
                    VStack(alignment: .leading, spacing: .nanoSpace) {
                        if let name = viewModel.exerciseSetData?.name {
                            Text(name)
                                .font(.largeTitleBold)
                        } else {
                            Text("Lower Back Exercises")
                                .font(.largeTitleBold)
                        }
                        
                        if let duration = viewModel.exerciseSetData?.duration {
                            Text(duration)
                                .font(.title3Regular)
                        } else {
                            Text("5 min")
                                .font(.title3Regular)
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
                        } else {
                            Image("Physiotherapy")
                                .frame(width: .mediumSpace, height: .mediumSpace)
                        }
                        
                        if let physiotherapyString = viewModel.exerciseSetData?.physiotherapyString {
                            Text(physiotherapyString)
                                .foregroundColor(.veniceBlue)
                        } else {
                            Text("Chosen by your physiotherapist")
                                .foregroundColor(.veniceBlue)
                        }
                    }
                    
                    Divider()
                    
                    if let exerciseTiles = viewModel.exerciseSetData?.exerciseTiles {
                        ScrollView(showsIndicators: false) {
                            ForEach(exerciseTiles.indices, id: \.self) { i in
                                NavigationLink(destination:
                                                ExerciseInstructionsView(viewModel:
                                                        .init(exerciseNumber: i + 1,
                                                              exerciseInstructionsURL: exerciseTiles[i].exerciseInstructionsURL))) {
                                    ExerciseTileView(viewModel:
                                            .init(exerciseTileData:
                                                    ExerciseTile(inlineIcon: exerciseTiles[i].inlineIcon,
                                                                 exerciseName: exerciseTiles[i].exerciseName,
                                                                 repetitions: exerciseTiles[i].repetitions,
                                                                 exerciseImage: exerciseTiles[i].exerciseImage)))
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, Constants.topPadding)
                .padding(.horizontal, .mediumSpace)
                .padding(.bottom, Constants.bottomPadding)
            }
            
            if let exerciseInstructionsURL = viewModel.exerciseSetData?.exerciseTiles?[0].exerciseInstructionsURL {
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: ExerciseInstructionsView(viewModel: .init(exerciseNumber: 1, exerciseInstructionsURL: exerciseInstructionsURL))) {
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
