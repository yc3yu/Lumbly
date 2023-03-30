//
//  ResultsForDayView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-21.
//

import SwiftUI

struct ResultsForDayView: View {
    let dayOfWeek: String
    let didExercise: Bool
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.horizontal, .bottom])
            
            VStack(spacing: 80.0) {
                Text(getDayOfWeek())
                    .font(.largeTitleBold)
                    .foregroundColor(.darkGray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40.0)
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
        switch dayOfWeek {
        case L10n.CalendarTileView.mon:
            return "Monday"
        case L10n.CalendarTileView.tue:
            return "Tuesday"
        case L10n.CalendarTileView.wed:
            return "Wednesday"
        case L10n.CalendarTileView.thu:
            return "Thursday"
        case L10n.CalendarTileView.fri:
            return "Friday"
        case L10n.CalendarTileView.sat:
            return "Saturday"
        case L10n.CalendarTileView.sun:
            return "Sunday"
        default:
            return ""
        }
    }
    
    func getContentString() -> String {
        if didExercise {
            return "This will show a list of exercise sets that you completed on the selected day.\n\n(This view is to be updated.)"
        } else {
            return "No exercises were completed on this day.\n\n(This view is to be updated.)"
        }
    }
}
