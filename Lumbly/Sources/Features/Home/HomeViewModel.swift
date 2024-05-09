//
//  HomeViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-22.
//

import SwiftUI

extension HomeView {
    class HomeViewModel: ObservableObject {
        typealias RelativeDate = CalendarTileView.CalendarTileViewModel.DateRelativeToToday
        
        @Published private(set) var homeData: Home? = nil
        @Published private(set) var isLoading: Bool = false
        
        let calendarTilesDayOfWeek: [String] = [L10n.CalendarTileView.mon,
                                                L10n.CalendarTileView.tue,
                                                L10n.CalendarTileView.wed,
                                                L10n.CalendarTileView.thu,
                                                L10n.CalendarTileView.fri,
                                                L10n.CalendarTileView.sat,
                                                L10n.CalendarTileView.sun]
        
        var calendarTilesDateRelativeToToday: [RelativeDate] {
            let calendar = Calendar.current
            var today = calendar.component(.weekday, from: Date())
            
            if today == 1 {
                today = 7
            } else {
                today -= 1
            }
            
            let result = [RelativeDate](repeating: .past, count: today - 1)
            + [RelativeDate.today]
            + [RelativeDate](repeating: .future, count: 7 - today)
            
            return result
        }
        
        @MainActor func fetchHomeData() async {
            guard !isLoading else { return }
            defer { isLoading =  false }
            isLoading = true
            
            let resource = HomeResource()
            let request = APIRequest(resource: resource)

            homeData = try? await request.execute()
        }
    }
}
