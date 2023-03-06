//
//  ResultsView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

struct ResultsView: View {
    private struct Constants {
        static let largePadding: CGFloat = 40.0
        static let dropDownCornerRadius: CGFloat = 10.0
        static let dropDownArrowSize: CGFloat = 17.0
        static let headerBottomSpacing: CGFloat = 12.0
    }
    
    @State private var selectedExercise: Int = 0
    @StateObject private var viewModel = ResultsViewModel()
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: .zero) {
                    HStack(alignment: .center, spacing: .mediumSpace) {
                        Text(L10n.ResultsView.results)
                            .font(.title1Bold)
                            .foregroundColor(.darkGray06)

                        Spacer()

                        if let exercises = viewModel.results?.exercises,
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

                    if let exercises = viewModel.results?.exercises,
                       exercises.count > 0 {
                        if let individualExerciseResults = viewModel.results?.individualExerciseResults,
                           $selectedExercise.wrappedValue < individualExerciseResults.count,
                           let currentExerciseResults = individualExerciseResults[$selectedExercise.wrappedValue] {
                            if let formMistakesTiles = currentExerciseResults.formMistakesTiles {
                                Text(L10n.ResultsView.formMistakes)
                                    .font(.title3Bold)
                                    .foregroundColor(.prussianBlue)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, Constants.headerBottomSpacing)
                                
                                ForEach(formMistakesTiles, id: \.self) { formMistakeTile in
                                    FormCommentTileView(viewModel: .init(formCommentTileData: formMistakeTile))
                                }
                            }
                            
                            if let wellDoneTiles = currentExerciseResults.wellDoneTiles {
                                Text(L10n.ResultsView.welldone)
                                    .font(.title3Bold)
                                    .foregroundColor(.prussianBlue)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, Constants.largePadding)
                                    .padding(.bottom, Constants.headerBottomSpacing)
                                
                                ForEach(wellDoneTiles, id: \.self) { wellDoneTile in
                                    FormCommentTileView(viewModel: .init(formCommentTileData: wellDoneTile))
                                }
                            }
                        } else {
                            Text(L10n.ResultsView.noResultsForThisExercise)
                                .font(.bodyBold)
                                .foregroundColor(.blueCharcoal)
                                .multilineTextAlignment(.center)
                                .padding(.top, Constants.largePadding)
                        }
                    } else {
                        Text(L10n.ResultsView.noResultsForThisSession)
                            .font(.bodyBold)
                            .foregroundColor(.blueCharcoal)
                            .multilineTextAlignment(.center)
                            .padding(.top, Constants.largePadding)
                    }

                    Spacer()
                }
                .padding(.top, Constants.largePadding)
            }
            .padding(.horizontal, .mediumSpace)
        }
        .navigationBarItems(trailing: NavigationLink(destination: HomeView()) {
            Text("Done")
        })
        .onAppear(perform: viewModel.fetchData)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

