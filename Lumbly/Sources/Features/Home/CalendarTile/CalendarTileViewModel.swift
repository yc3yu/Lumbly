//
//  CalendarTileViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

extension CalendarTileView {
    class ViewModel: ObservableObject {
        enum DateRelativeToToday {
            case past
            case today
            case future
        }
        
        private(set) var calendarTileData: CalendarTile?
        
        private(set) var dayOfWeek: String?
        
        private(set) var dateRelativeToToday: DateRelativeToToday?
        
        init(calendarTileData: CalendarTile?, dayOfWeek: String?, dateRelativeToToday: DateRelativeToToday?) {
            self.calendarTileData = calendarTileData
            self.dayOfWeek = dayOfWeek
            self.dateRelativeToToday = dateRelativeToToday
        }
    }
}

