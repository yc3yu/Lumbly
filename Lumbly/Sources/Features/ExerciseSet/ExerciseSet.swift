//
//  ExerciseSet.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-28.
//

struct ExerciseSet: Decodable {
    var name: String?
    var duration: String?
    var physiotherapyIcon: String?
    var physiotherapyString: String?
    var exerciseTiles: [ExerciseTile]?
}
