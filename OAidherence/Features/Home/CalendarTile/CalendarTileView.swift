//
//  CalendarTileView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct CalendarTileView: View {
    private struct Constants {
        static let borderWidth: CGFloat = 2.5
        static let cornerRadius: CGFloat = 10.0
        static let checkmarkSize: CGFloat = 20.0
        static let circleSize: CGFloat = 6.0
    }
    
    @StateObject var viewModel: CalendarTileViewModel
    
    var body: some View {
        ZStack {
            let tileColors = getColors(dateRelativeToToday: viewModel.dateRelativeToToday)
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .fill(tileColors.tileColor ?? .oysterBay)
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                .strokeBorder(tileColors.borderColor ?? .veniceBlue, lineWidth: Constants.borderWidth)

            VStack(spacing: .zero) {
                if let dayOfWeek = viewModel.dayOfWeek {
                    Text(dayOfWeek)
                        .font(.caption1Bold)
                        .foregroundColor(tileColors.accentColor ?? .veniceBlue)
                }
                
                if let didExercise = viewModel.calendarTileData?.didExercise,
                   viewModel.dateRelativeToToday != .future,
                   didExercise {
                    Image("DidExercise")
                        .renderingMode(.template)
                        .foregroundColor(tileColors.accentColor ?? .veniceBlue)
                        .padding(.top, .smallSpace)
                } else {
                    Circle()
                        .foregroundColor(tileColors.accentColor ?? .veniceBlue)
                        .frame(width: Constants.circleSize, height: Constants.circleSize)
                        .padding(.top, .mediumSpace)
                }
                 
                Spacer()
            }
            .padding(.top, .smallSpace)
            
            if let didExercise = viewModel.calendarTileData?.didExercise,
               viewModel.dateRelativeToToday != .future {
                NavigationLink(destination: ResultsForDayView(viewModel: .init(dayOfWeek: viewModel.dayOfWeek ?? "", didExercise: didExercise))) {
                    Color.clear
                }
            }
        }
    }
    
    func getColors(dateRelativeToToday: CalendarTileViewModel.DateRelativeToToday?) -> (tileColor: Color?, borderColor: Color?, accentColor: Color?) {
        if let dateRelativeToToday = dateRelativeToToday {
            switch(dateRelativeToToday) {
            case .past:
                return (tileColor: .veniceBlue,
                        borderColor: .veniceBlue,
                        accentColor: .sinbadBlue)
            case .today:
                return (tileColor: .prussianBlue,
                        borderColor: .prussianBlue,
                        accentColor: .sinbadBlue)
            case .future:
                return (tileColor: .oysterBay,
                        borderColor: .veniceBlue,
                        accentColor: .veniceBlue)
            }
        }
        
        return (tileColor: nil, borderColor: nil, accentColor: nil)
    }
}

struct CalendarTileView_Previews: PreviewProvider {
    private struct Constants {
        static let tileWidth: CGFloat = 62.0
        static let tileHeight: CGFloat = 100.0
    }
    
    static var previews: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: true),
                             dayOfWeek: "MON",
                              dateRelativeToToday: .past))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: false),
                             dayOfWeek: "TUE",
                              dateRelativeToToday: .past))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: true),
                             dayOfWeek: "WED",
                              dateRelativeToToday: .today))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: false),
                             dayOfWeek: "THU",
                              dateRelativeToToday: .future))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: false),
                             dayOfWeek: "FRI",
                              dateRelativeToToday: .future))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: false),
                             dayOfWeek: "SAT",
                              dateRelativeToToday: .future))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
                
                CalendarTileView(viewModel:
                        .init(calendarTileData:
                                CalendarTile(didExercise: false),
                             dayOfWeek: "SUN",
                              dateRelativeToToday: .future))
                .frame(width: Constants.tileWidth, height: Constants.tileHeight)
            }
        }
    }
}
