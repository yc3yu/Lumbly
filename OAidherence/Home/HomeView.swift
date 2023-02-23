//
//  HomeView.swift
//  OAidherence
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
    
    var body: some View {
        VStack(spacing: .zero) {
            ZStack {
                Color.mercuryGrey
                    .ignoresSafeArea(.container)
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: .zero) {
                        Image("LumblyWordOnly")
                            .resizable()
                            .frame(width: Constants.lumblyLogoWidth, height: Constants.lumblyLogoHeight)
                        
                        Spacer()
                        
                        Image("ProfilePicture")
                            .resizable()
                            .frame(width: Constants.profilePictureWidth, height: Constants.profilePictureHeight)
                    }
                    .padding(.leading, .smallSpace)
                    .padding(.trailing, .mediumSpace)
                    .padding(.bottom, Constants.topSectionBottomPadding)
                }
            }
            .frame(height: Constants.topSectionHeight)
            
            ZStack {
                Color.oysterBay
                
                VStack(alignment: .leading, spacing: .zero) {
                        Text(L10n.HomeView.exercises)
                            .font(.title2Bold)
                            .padding(.horizontal, .mediumSpace)
                            .padding(.bottom, .smallSpace)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer(minLength: .mediumSpace)
                                
                                ExerciseSetTileView(viewModel: .init(exerciseSetTileData: .init(exerciseSetName: "Lower Back Exercises", duration: "5 min")))
                                    .frame(width: Constants.exerciseSetTilesWidth)
                                
                                ExerciseSetTileView(viewModel: .init(exerciseSetTileData: .init(exerciseSetName: "Lower Back Exercises", duration: "5 min")))
                                    .frame(width: Constants.exerciseSetTilesWidth)
                                
                                Spacer(minLength: .mediumSpace)
                            }
                        }
                        .frame(height: Constants.exerciseSetTilesHeight)
                        .padding(.bottom, Constants.sectionSpacing)
                    
                    VStack(alignment: .leading) {
                        Text(L10n.HomeView.calendar)
                            .font(.title2Bold)
                            .padding(.horizontal, .mediumSpace)
                            .padding(.bottom, .smallSpace)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer(minLength: .mediumSpace)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: true),
                                             dayOfWeek: "MON",
                                              dateRelativeToToday: .past))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: false),
                                             dayOfWeek: "TUE",
                                              dateRelativeToToday: .past))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: true),
                                             dayOfWeek: "WED",
                                              dateRelativeToToday: .today))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: false),
                                             dayOfWeek: "THU",
                                              dateRelativeToToday: .future))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: false),
                                             dayOfWeek: "FRI",
                                              dateRelativeToToday: .future))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: false),
                                             dayOfWeek: "SAT",
                                              dateRelativeToToday: .future))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                CalendarTileView(viewModel:
                                        .init(calendarTileData:
                                                CalendarTile(didExercise: false),
                                             dayOfWeek: "SUN",
                                              dateRelativeToToday: .future))
                                .frame(width: Constants.calendarTilesWidth, height: Constants.calendarTilesHeight)
                                
                                Spacer(minLength: .mediumSpace)
                            }
                        }
                    }
                        
                    Spacer()
                }
                .padding(.top, Constants.sectionSpacing)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
