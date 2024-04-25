//
//  ResultsAvailabilityResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-10.
//

struct ResultsAvailabilityResource: APIResource {
    typealias ModelType = ResultsAvailability
    
    var url: URL?
    
    mutating func setURL(userID: String,
                         parentExerciseSet: String,
                         exerciseName: String,
                         timestamp: String) {
        let endpoint = APIEndpoints.resultsAvailablity(userID: userID,
                                                       parentExerciseSet: parentExerciseSet,
                                                       exerciseName: exerciseName,
                                                       timestamp: timestamp)
        let urlString = endpoint.rawValue
        
        self.url = URL(string: urlString)
    }
}
