//
//  APIEndpoints.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2022-12-05.
//

enum APIEndpoints: RawRepresentable, APIProtocol {
    static let baseURL = URL(string: "https://temporarylumblyfunction.azurewebsites.net/api")
    
    case connectionString
    case home
    case exerciseSet
    case resultsAvailablity(userID: String,
                            parentExerciseSet: String,
                            exerciseName: String,
                            timestamp: String)
    case results(userID: String,
                 parentExerciseSet: String,
                 timestamp: String)
    
    var rawValue: String {
        switch self {
        case .connectionString: return "/connection_string"
        case .home: return "/home"
        case .exerciseSet: return "/exercise_set"
        case .resultsAvailablity(let userID,
                                 let parentExerciseSet,
                                 let exerciseName,
                                 let timestamp):
            return "/results_exist/\(userID)/\(parentExerciseSet)/\(exerciseName)/\(timestamp)"
        case .results(let userID,
                      let parentExerciseSet,
                      let timestamp):
            return "/results/\(userID)/\(parentExerciseSet)/\(timestamp)"
        }
    }
}

extension RawRepresentable where RawValue == String, Self: APIProtocol {
    var url: URL? {
        Self.baseURL?.appendingPathComponent(rawValue)
    }
    
    init?(rawValue: String) { nil }
}
