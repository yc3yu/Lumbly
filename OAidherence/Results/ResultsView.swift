//
//  ResultsView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

extension ResultsView {
    struct Problem: Hashable {
        var icon: String
        var name: String
//        var problemDescription: String
//        var problemImage: Image
//        var solutionDescription: String
//        var solutionImage: Image
        
    }
    
    struct ViewModel {
        var exercises: [String]? // Array of available exercises to select in drop-down menu
        var selectedIndex: Int? // Index of selected element in array of exercises
        var problems: [Problem]?
        var summaryGraphTitle: String?
        var summaryGraphXLabel: String?
        var summaryGraphYLabel: String?
        
    }
}

struct ResultsView: View {
    private struct Constants {
        static let dropShadowOpacity: CGFloat = 0.25
        static let graphHeight: CGFloat = 166.0
        static let problemIconSize: CGFloat = 44.0
        static let exercisesButtonColor: Color = Color(red: 118/255, green: 118/255, blue: 128/255).opacity(0.12)
        static let exercisesButtonDropShadowColor: Color = Color(.black).opacity(0.25)
    }
    
    @State private var problemsOrWellDone = L10n.ResultsView.problems
    
    let viewModel: ViewModel?
    let exerciseMenuSelection: (() -> ())?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(L10n.ResultsView.results).font(.title1Bold)
                    
                    Spacer()
                    
                    if let exercises = viewModel?.exercises,
                       let selectedIndex = viewModel?.selectedIndex {
                        Button(action: { }) {
                            HStack {
                                Text(exercises[selectedIndex])
                                    .foregroundColor(.secondary)
                                    .padding([.trailing], .mediumSpace)
                                
                                Image("Expand Arrow")
                                    .resizable()
                                    .frame(width: .littleSpace, height: .littleSpace)
                            }
                        }
                        .padding(.miniSpace)
                        .background(Constants.exercisesButtonColor)
                        .cornerRadius(.littleSpace)
                        .shadow(color: Constants.exercisesButtonDropShadowColor, radius: .nanoSpace, x: 0, y: .nanoSpace)
                    }
                }.padding(.bottom, .mediumSpace)
                
                if let summaryGraphTitle = viewModel?.summaryGraphTitle {
                    Text(summaryGraphTitle)
                        .font(.caption1Bold)
                    Image("Placeholder")
                        .resizable()
                        .frame(height: Constants.graphHeight)
                        .padding(.bottom, .smallSpace)
                }
                
                Picker(L10n.ResultsView.problemsOrWellDone, selection: $problemsOrWellDone) {
                    Text(L10n.ResultsView.problems)
                        .tag(L10n.ResultsView.problems)
                    Text(L10n.ResultsView.welldone)
                        .tag(L10n.ResultsView.welldone)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, .hugeSpace)
            }
            
            if problemsOrWellDone == L10n.ResultsView.problems {
                if let problems = viewModel?.problems {
                    ScrollView(showsIndicators: false) {
                        ForEach(problems, id: \.self) { problem in
                            HStack(alignment: .center, spacing: .littleSpace) {
                                AsyncImage(url: URL(string: problem.icon))
                                    .frame(width: Constants.problemIconSize, height: Constants.problemIconSize, alignment: .center)
                                
                                Spacer()
                                
                                Text(problem.name)
                                    .font(.bodyBold)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                Image("Expand Arrow")
                                    .resizable()
                                    .frame(width: .littleSpace, height: .littleSpace, alignment: .center)
                            }
                            .padding(.smallSpace)
                            .background(.white)
                            .cornerRadius(.littleSpace)
                            .shadow(color: Constants.exercisesButtonDropShadowColor, radius: .nanoSpace, x: 0, y: 0)
                            .padding(.horizontal, .nanoSpace)
                            .padding(.vertical, .miniSpace)
                        }.padding(.top, .nanoSpace)
                    }
                } else {
                    Text(L10n.ResultsView.noProblemsDetected)
                        .font(.bodyRegular)
                        .multilineTextAlignment(.center)
                        .padding(.top, .largeSpace)
                }
            }
            
            // TODO: Add else case for well-done tab once the design is created
            
            Spacer()
        }.padding(.horizontal, .largeSpace)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static let imageURL: String = "https://www.flaticon.com/free-icon/exercise_991924"
    
    static var previews: some View {
        ResultsView(viewModel: .init(exercises: ["Bird dog", "Filler", "Example"],
                                     selectedIndex: 0,
                                     problems: [ResultsView.Problem(icon: ResultsView_Previews.imageURL,
                                                      name: "Leg lifted too high"),
                                                ResultsView.Problem(icon: ResultsView_Previews.imageURL,
                                                      name: "A long problem string that flows to two lines"),
                                                ResultsView.Problem(icon: ResultsView_Previews.imageURL,
                                                      name: "A long problem string that flows to more than two lines of text"),
                                                ResultsView.Problem(icon: ResultsView_Previews.imageURL,
                                                      name: "Another problem"),
                                                ResultsView.Problem(icon: ResultsView_Previews.imageURL,
                                                      name: "One more problem")],
                                     summaryGraphTitle: "AVERAGE FORM CORRECTNESS "),
                    exerciseMenuSelection: { })
        
//        ResultsView(viewModel: .init(exercises: ["Bird dog", "Filler", "Example"],
//                                     selectedIndex: 0,
//                                     summaryGraphTitle: "AVERAGE FORM CORRECTNESS "),
//                    exerciseMenuSelection: { })
    }
}

