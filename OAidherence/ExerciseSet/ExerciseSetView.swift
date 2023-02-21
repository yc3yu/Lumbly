//
//  ExerciseSetView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

struct ExerciseSetView: View {
    private struct Constants {
        static let startButtonWidth: CGFloat = 366.0
        static let startButtonHeight: CGFloat = 50.0
        static let startButtonCornerRadius: CGFloat = 15.0
    }
    
    @StateObject private var viewModel = ExerciseSetViewModel()
    
    var body: some View {
        NavigationView {
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
                            AsyncImage(url: URL(string: physiotherapyIcon))
                                .frame(width: .mediumSpace, height: .mediumSpace)
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
                        ScrollView {
                            ForEach(exerciseTiles, id: \.self) { exerciseTile in
                                ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                                    inlineIcon: exerciseTile.inlineIcon,
                                    exerciseName: exerciseTile.exerciseName,
                                    reps: exerciseTile.reps,
                                    exerciseImage: exerciseTile.exerciseImage)))
                            }
                        }
                    } else {
                        VStack {
                            ScrollView(showsIndicators: false) {
                                ExerciseTileView(viewModel: .init(exerciseTileData: ExerciseTile(
                                    inlineIcon: "https://cs210032000a530a4b5.blob.core.windows.net/lumblyimage/Physiotherapy.png?sv=2021-10-04&st=2023-02-20T05%3A11%3A41Z&se=2023-02-21T05%3A11%3A41Z&sr=b&sp=r&sig=JU9hfpsfpyvRcz2nBv0QN%2FRv6ItBzqOze61IwY80lls%3D",
                                    exerciseName: "Bird Dog",
                                    reps: "10 Repetitions (per side)",
                                    exerciseImage: "https://cs210032000a530a4b5.blob.core.windows.net/lumblyimage/Rectangle%208.png?sv=2021-10-04&st=2023-02-20T05%3A12%3A06Z&se=2023-02-21T05%3A12%3A06Z&sr=b&sp=r&sig=%2FzlHkdkS8dbdiP46jBFvx3KRasY8mOFuNmGVvuBBmfI%3D")))
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
                .padding(.top, .miniSpace)
                .padding(.horizontal, .mediumSpace)
            }
        }
    }
}

struct ExerciseSetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSetView()
    }
}
