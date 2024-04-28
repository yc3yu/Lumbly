//
//  ExerciseInstructions.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-28.
//

struct ExerciseInstructions: Decodable {
    var exerciseName: String?
    var repetitions: String?
    var recordingInfoModalBodyText: String?
    var mainImage: String?
    var exerciseSteps: [ExerciseStep]?
    var exerciseTips: [ExerciseTip]?
}
