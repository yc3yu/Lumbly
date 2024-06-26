//
//  HomeView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct HomeView: View {
    private struct Constants {
        static let topSectionHeight: CGFloat = 133.0
        static let topSectionBottomPadding: CGFloat = 10.0
        static let sectionSpacing: CGFloat = 40.0
        static let lumblyLogoWidth: CGFloat = 186.0
        static let lumblyLogoHeight: CGFloat = 64.0
        static let profilePictureWidth: CGFloat = 50.0
        static let profilePictureHeight: CGFloat = 53.0
        static let exerciseSetTilesWidth: CGFloat = 272
        static let exerciseSetTilesHeight: CGFloat = 158.0
        static let calendarTilesWidth: CGFloat = 62.0
        static let calendarTilesHeight: CGFloat = 100.0
    }
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var navigationBarHidden: Bool = true

    var body: some View {
        Group {
            if viewModel.isLoading {
                LoadingView()
            } else {
                VStack(spacing: .zero) {
                    ZStack {
                        Color.mercuryGrey
                            .ignoresSafeArea(.container)
                        
                        VStack {
                            Spacer()
                            
                            HStack(spacing: .zero) {
                                Image(asset: Asset.lumblyWordOnly)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: Constants.lumblyLogoWidth, height: Constants.lumblyLogoHeight)
                                
                                Spacer()
                                
                                if let profilePicture = viewModel.homeData?.profilePicture {
                                    NavigationLink(destination: ProfileView()) {
                                        AsyncImage(url: URL(string: profilePicture)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Circle())
                                                .frame(width: Constants.profilePictureWidth, height: Constants.profilePictureHeight)
                                        } placeholder: {
                                            Image(systemName: L10n.HomeView.emptyProfileIcon)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: Constants.profilePictureWidth, height: Constants.profilePictureHeight)
                                                .foregroundStyle(Color.prussianBlue)
                                        }
                                    }
                                }
                            }
                            .padding(.leading, .smallSpace)
                            .padding(.trailing, .mediumSpace)
                            .padding(.bottom, Constants.topSectionBottomPadding)
                        }
                    }
                    .frame(height: Constants.topSectionHeight)
                    
                    ZStack {
                        Color.oysterBay
                            .ignoresSafeArea(.container)
                        
                        VStack(alignment: .leading, spacing: .zero) {
                            Text(L10n.HomeView.exerciseSets)
                                .font(.title2Bold)
                                .foregroundColor(.blueCharcoal)
                                .padding(.horizontal, .mediumSpace)
                                .padding(.bottom, .smallSpace)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Spacer(minLength: .mediumSpace)
                                    
                                    if let exerciseSetTiles = viewModel.homeData?.exerciseSetTiles {
                                        ForEach(exerciseSetTiles, id: \.self) { exerciseSetTile in
                                            NavigationLink(destination: ExerciseSetView(viewModel: .init(exerciseSetURL: exerciseSetTile.exerciseSetURL))) {
                                                ExerciseSetTileView(viewModel: .init(exerciseSetTileData: exerciseSetTile))
                                                    .frame(width: Constants.exerciseSetTilesWidth)
                                            }
                                            .simultaneousGesture(TapGesture().onEnded {
                                                self.navigationBarHidden = false
                                            })
                                        }
                                    }
                                    
                                    Spacer(minLength: .mediumSpace)
                                }
                            }
                            .frame(height: Constants.exerciseSetTilesHeight)
                            .padding(.bottom, Constants.sectionSpacing)
                            
                            VStack(alignment: .leading) {
                                Text(L10n.HomeView.calendar)
                                    .font(.title2Bold)
                                    .foregroundColor(.blueCharcoal)
                                    .padding(.horizontal, .mediumSpace)
                                    .padding(.bottom, .smallSpace)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        Spacer(minLength: .mediumSpace)
                                        
                                        if let calendarTiles = viewModel.homeData?.calendarTiles {
                                            let calendarTilesDateRelativeToToday = viewModel.calendarTilesDateRelativeToToday
                                            
                                            ForEach(calendarTiles.indices, id: \.self) { i in
                                                CalendarTileView(viewModel:
                                                        .init(calendarTileData:
                                                                CalendarTile(didExercise: calendarTiles[i].didExercise),
                                                              dayOfWeek: viewModel.calendarTilesDayOfWeek[i],
                                                              dateRelativeToToday: calendarTilesDateRelativeToToday[i]))
                                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                            }
                                        }
                                        
                                        Spacer(minLength: .mediumSpace)
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top, Constants.sectionSpacing)
                    }
                }
            }
        }
        .navigationBarHidden(navigationBarHidden)
        .onAppear {
            self.navigationBarHidden = true
        }
        .task {
            await viewModel.fetchHomeData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
