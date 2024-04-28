//
//  Home.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-28.
//

struct Home: Decodable {
    var profilePicture: String?
    var exerciseSetTiles: [ExerciseSetTile]?
    var calendarTiles: [CalendarTile]?
}
