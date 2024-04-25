//
//  ResultsResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-10.
//

struct ResultsResource: APIResource {
    typealias ModelType = Results
    
    var url: URL?
    
    mutating func setURL(userID: String, parentExerciseSet: String, timestamp: String) {
        let endpoint = APIEndpoints.results(userID: userID,
                                            parentExerciseSet: parentExerciseSet,
                                            timestamp: timestamp)
        let urlString = endpoint.rawValue
        
        self.url = URL(string: urlString)
    }
}
