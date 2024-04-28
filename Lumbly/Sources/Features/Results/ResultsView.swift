//
//  ResultsView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

struct ResultsView: View {
    private struct Constants {
        static let largePadding: CGFloat = 40.0
        static let vStackSpacing: CGFloat = 80.0
        static let dropDownCornerRadius: CGFloat = 10.0
        static let dropDownArrowSize: CGFloat = 17.0
        static let headerBottomSpacing: CGFloat = 12.0
    }
    
    private var loadingView: some View {
        LoadingView(loadingText: L10n.ResultsView.loading)
    }
    
    private var resultsHeader: some View {
        HStack(alignment: .center, spacing: .mediumSpace) {
            Text(L10n.ResultsView.results)
                .font(.largeTitleBold)
                .foregroundColor(.darkGray06)
            
            Spacer()
        }
    }
    
    @State private var selectedExercise: Int = 0
    @StateObject var viewModel: ResultsViewModel
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
            
            switch viewModel.resultsAvailability.status {
            case .available:
                if viewModel.isLoading {
                    loadingView
                } else {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: .zero) {
                            HStack(alignment: .center, spacing: .mediumSpace) {
                                Text(L10n.ResultsView.results)
                                    .font(.largeTitleBold)
                                    .foregroundColor(.darkGray06)
                                
                                Spacer()
                                
                                if let exercises = viewModel.resultsData?.exercises,
                                   exercises.count > 0 {
                                    Menu {
                                        ForEach(exercises.indices, id: \.self) { i in
                                            Button {
                                                selectedExercise = i
                                            } label: {
                                                Text(exercises[i])
                                            }
                                        }
                                    } label: {
                                        HStack(spacing: .smallSpace) {
                                            Text(exercises[$selectedExercise.wrappedValue])
                                                .foregroundColor(.resolutionBlue)
                                                .lineLimit(1)
                                                .truncationMode(.tail)
                                            
                                            Image("Expand Arrow")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: Constants.dropDownArrowSize, height: Constants.dropDownArrowSize)
                                        }
                                        .padding(.miniSpace)
                                        .background(
                                            RoundedRectangle(cornerRadius: Constants.dropDownCornerRadius)
                                                .foregroundColor(.mercuryGrey)
                                        )
                                    }
                                }
                            }
                            .padding(.bottom, .mediumSpace)
                            
                            if let exercises = viewModel.resultsData?.exercises,
                               !exercises.isEmpty {
                                if let individualExerciseResults = viewModel.resultsData?.individualExerciseResults,
                                   $selectedExercise.wrappedValue < individualExerciseResults.count,
                                   let currentExerciseResults = individualExerciseResults[$selectedExercise.wrappedValue] {
                                    if let formMistakesTiles = currentExerciseResults.formMistakesTiles,
                                       !formMistakesTiles.isEmpty {
                                        Text(L10n.ResultsView.formMistakes)
                                            .font(.title3Bold)
                                            .foregroundColor(.prussianBlue)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.bottom, Constants.headerBottomSpacing)
                                        
                                        VStack(spacing: .mediumSpace) {
                                            ForEach(formMistakesTiles, id: \.self) { formMistakeTile in
                                                FormCommentTileView(viewModel: .init(formCommentTileData: formMistakeTile, isFormMistake: true))
                                            }
                                        }
                                    }
                                    
                                    if let wellDoneTiles = currentExerciseResults.wellDoneTiles,
                                       !wellDoneTiles.isEmpty {
                                        Text(L10n.ResultsView.welldone)
                                            .font(.title3Bold)
                                            .foregroundColor(.prussianBlue)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top, Constants.largePadding)
                                            .padding(.bottom, Constants.headerBottomSpacing)
                                        
                                        VStack(spacing: .mediumSpace) {
                                            ForEach(wellDoneTiles, id: \.self) { wellDoneTile in
                                                FormCommentTileView(viewModel: .init(formCommentTileData: wellDoneTile))
                                            }
                                        }
                                    }
                                } else {
                                    Text(L10n.ResultsView.noResultsForThisExercise)
                                        .font(.bodyBold)
                                        .foregroundColor(.blueCharcoal)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, Constants.largePadding)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top, Constants.largePadding)
                    }
                    .padding(.horizontal, .mediumSpace)
                }
            case .error:
                ErrorView(viewModel:
                        .init(header: L10n.ResultsView.results,
                              errorText: L10n.ResultsView.error))
            case .badVideo:
                ErrorView(viewModel:
                        .init(header: L10n.ResultsView.results,
                              errorText: L10n.ResultsView.badVideo))
            case .noResults:
                ErrorView(viewModel:
                        .init(header: L10n.ResultsView.results,
                              errorText: L10n.ResultsView.noResultsForThisSession))
            default:
                loadingView
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(destination: HomeView()) {
            switch viewModel.resultsAvailability.status {
            case .loading:
                Text(L10n.NavigationBarItem.exit)
            default:
                Text(L10n.NavigationBarItem.done)
            }
        })
        .task {
            viewModel.fetchResults()
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewModel:
                .init(recordingViewModel:
                        .init(isTestRun: false,
                              parentView: .init(viewModel: .init(parentExerciseSet: "",
                                                                 exerciseNumber: 2,
                                                                 exerciseInstructionsURL: nil,
                                                                 isTestRun: false)),
                              parentExerciseSet: "",
                              exerciseName: "", 
                              recordingInfoModalBodyText: "")))
    }
}
