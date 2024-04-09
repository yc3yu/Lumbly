//
//  HomeViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

struct Home: Decodable {
    var profilePicture: String?
    var exerciseSetTiles: [ExerciseSetTile]?
    var calendarTiles: [CalendarTile]?
}

extension HomeView {
    class HomeViewModel: ObservableObject {
        @Published private(set) var homeData: Home? = nil
        
        let calendarTilesDayOfWeek: [String] = [L10n.CalendarTileView.mon,
                                                L10n.CalendarTileView.tue,
                                                L10n.CalendarTileView.wed,
                                                L10n.CalendarTileView.thu,
                                                L10n.CalendarTileView.fri,
                                                L10n.CalendarTileView.sat,
                                                L10n.CalendarTileView.sun]
        
        var calendarTilesDateRelativeToToday: [CalendarTileView.CalendarTileViewModel.DateRelativeToToday] {
            let calendar = Calendar.current
            var today = calendar.component(.weekday, from: Date())
            
            if today == 1 {
                today = 7
            } else {
                today -= 1
            }
            
            let result = [CalendarTileView.CalendarTileViewModel.DateRelativeToToday](repeating: .past, count: today - 1)
            + [CalendarTileView.CalendarTileViewModel.DateRelativeToToday.today]
            + [CalendarTileView.CalendarTileViewModel.DateRelativeToToday](repeating: .future, count: 7 - today)
            
            return result
        }
        
        @MainActor func fetchHomeData() async throws {
            let resource = HomeResource()
            let request = APIRequest(resource: resource)

            homeData = try await request.execute()
        }
    }
}
