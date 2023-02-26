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
    }
    
    @StateObject private var viewModel = ExerciseSetViewModel()
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            
            VStack(alignment: .leading, spacing: .mediumSpace) {
                VStack(alignment: .leading, spacing: .nanoSpace) {
                    if let name = viewModel.exerciseSet?.name {
                        Text(name)
                            .font(.largeTitleBold)
                    } else {
                        Text("Lower Back Exercises")
                            .font(.largeTitleBold)
                    }
                    
                    if let duration = viewModel.exerciseSet?.duration {
                        Text(duration)
                            .font(.title3Regular)
                    } else {
                        Text("5 min")
                            .font(.title3Regular)
                    }
                }
                
                HStack {
                    if let physiotherapyIcon = viewModel.exerciseSet?.physiotherapyIcon {
                        AsyncImage(url: URL(string: physiotherapyIcon), content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: .mediumSpace, height: .mediumSpace)
                        }, placeholder: { })
                    } else {
                        Image("Physiotherapy")
                            .frame(width: .mediumSpace, height: .mediumSpace)
                    }
                    
                    if let physiotherapyString = viewModel.exerciseSet?.physiotherapyString {
                        Text(physiotherapyString)
                            .foregroundColor(.veniceBlue)
                    } else {
                        Text("Chosen by your physiotherapist")
                            .foregroundColor(.veniceBlue)
                    }
                }
                
                Divider()
                
                if let exerciseTiles = viewModel.exerciseSet?.exerciseTiles {
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
                } else {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                                inlineIcon: "https://templumblygroup.blob.core.windows.net/lumblyimage/Physiotherapy.png?sv=2021-10-04&st=2023-02-21T04%3A14%3A20Z&se=2023-05-02T03%3A14%3A00Z&sr=b&sp=r&sig=wRkRNDHXQxlZ3QA%2BWFnCGLpMdBvROF0vDp64lO9S57I%3D",
                                exerciseName: "Bird Dog",
                                repetitions: "10 Repetitions (per side)",
                                exerciseImage: "https://templumblygroup.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-21T04%3A15%3A06Z&se=2023-05-02T03%3A15%3A00Z&sr=b&sp=r&sig=5Dtbk8LgQ%2Fyhy6Sq8k8pblmbIKRfPeFnm79%2Ftcq6pas%3D")))
                        }
                    }
                }
                
                Button(action: {
                    
                }) {
                    Text(L10n.ExerciseSetView.startExerciseSet)
                        .font(.title3Bold)
                        .foregroundColor(.mercuryGrey)
                        .frame(maxWidth: .infinity)
                        .frame(height: Constants.startButtonHeight, alignment: .center)
                        .background(Color.veniceBlue)
                        .cornerRadius(Constants.startButtonCornerRadius)
                        .padding(.bottom, .mediumSpace)
                }
            }
            .ignoresSafeArea(.container)
            .padding(.top, Constants.topPadding)
            .padding(.horizontal, .mediumSpace)
            .onAppear(perform: viewModel.fetchData)
        }
    }
}

struct ExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSetView()
    }
}
