//
//  CalendarTileViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct CalendarTile: Decodable, Hashable {
    var didExercise: Bool?
}

extension CalendarTileView {
    class CalendarTileViewModel: ObservableObject {
        enum DateRelativeToToday {
            case past
            case today
            case future
        }
        
        @Published private(set) var calendarTileData: CalendarTile?
        
        var dayOfWeek: String?
        
        var dateRelativeToToday: DateRelativeToToday?
        
        init(calendarTileData: CalendarTile?, dayOfWeek: String?, dateRelativeToToday: DateRelativeToToday?) {
            self.calendarTileData = calendarTileData
            self.dayOfWeek = dayOfWeek
            self.dateRelativeToToday = dateRelativeToToday
        }
    }
}

