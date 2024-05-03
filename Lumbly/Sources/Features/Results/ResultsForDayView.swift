//
//  ResultsForDayView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-21.
//

import SwiftUI

struct ResultsForDayView: View {
    private struct Constants {
        static let vStackSpacing: CGFloat = 80.0
        static let topPadding: CGFloat = 40.0
    }

    var viewModel: ResultsForDayViewModel

    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.horizontal, .bottom])
            
            VStack(spacing: Constants.vStackSpacing) {
                Text(getDayOfWeek())
                    .font(.largeTitleBold)
                    .foregroundColor(.darkGray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Constants.topPadding)
                    .padding(.horizontal, .mediumSpace)
                
                Text(getContentString())
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
    
    func getDayOfWeek() -> String {
        switch viewModel.dayOfWeek {
        case L10n.CalendarTileView.mon:
            return L10n.CalendarTileView.monday
        case L10n.CalendarTileView.tue:
            return L10n.CalendarTileView.tuesday
        case L10n.CalendarTileView.wed:
            return L10n.CalendarTileView.wednesday
        case L10n.CalendarTileView.thu:
            return L10n.CalendarTileView.thursday
        case L10n.CalendarTileView.fri:
            return L10n.CalendarTileView.friday
        case L10n.CalendarTileView.sat:
            return L10n.CalendarTileView.saturday
        case L10n.CalendarTileView.sun:
            return L10n.CalendarTileView.sunday
        default:
            return ""
        }
    }
    
    func getContentString() -> String {
        if viewModel.didExercise {
            return "This will show a list of exercise sets that you completed on the selected day.\n\n(This view is to be updated.)" // Placeholder for demo purposes
        } else {
            return "No exercises were completed on this day.\n\n(This view is to be updated.)" // Placeholder for demo purposes
        }
    }
}
