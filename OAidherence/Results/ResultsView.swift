//
//  ResultsView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

struct ResultsView: View {
    private struct Constants {
        static let dropShadowOpacity: CGFloat = 0.25
        static let graphHeight: CGFloat = 166.0
        static let problemIconSize: CGFloat = 44.0
        static let exercisesButtonColor: Color = Color(red: 118/255, green: 118/255, blue: 128/255).opacity(0.12)
        static let exercisesButtonDropShadowColor: Color = Color(.black).opacity(0.25)
    }
    
    @State private var problemsOrWellDone = L10n.ResultsView.problems
    @StateObject private var viewModel = ResultsViewModel()
    
    // TODO: Add functional drop-down menu of exercises
    // let exerciseMenuSelection: (() -> ())?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(L10n.ResultsView.results).font(.title1Bold)
                    
                    Spacer()
                    
                    if let exercises = viewModel.results?.exercises {
                        Button(action: { }) {
                            HStack {
                                Text(exercises[0]) // TODO: Remove hard-coded selected exercise index (make functional drop-down menu)
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
                
                if let summaryGraphTitle = viewModel.results?.summaryGraphTitle {
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
                if let problems = viewModel.results?.problems {
                    ScrollView(showsIndicators: false) {
                        ForEach(problems, id: \.self) { problem in
                            HStack(alignment: .center, spacing: .littleSpace) {
                                if let problemIcon = problem.icon {
                                    AsyncImage(url: URL(string: problemIcon), content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: Constants.problemIconSize, height: Constants.problemIconSize, alignment: .center)
                                    }, placeholder: {
                                        Image("Placeholder")
                                            .resizable()
                                            .frame(width: Constants.problemIconSize, height: Constants.problemIconSize, alignment: .center)
                                            .padding(.bottom, .smallSpace)
                                    })
                                        
                                }
                                
                                Spacer()
                                
                                if let problemName = problem.name {
                                    Text(problemName)
                                        .font(.bodyBold)
                                        .multilineTextAlignment(.center)
                                }
                                
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
        }
        .padding(.horizontal, .largeSpace)
        .onAppear(perform: viewModel.fetchData)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

