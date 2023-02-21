//
//  APIHandler.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import Foundation

class APIHandler {
    func fetchResultsData(completion : @escaping ((Results) -> ())) {
        if let url = URL(string: APIEndpoints.resultsURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        // TODO: Change from array of Results to just single Results object (both here and in API server)
                        
                        if let data = data,
                           let results = try? jsonDecoder.decode([Results].self, from: data) {
                            completion(results[0])
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchExerciseSetData(completion : @escaping ((ExerciseSet) -> ())) {
        if let url = URL(string: APIEndpoints.exerciseSetURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let exerciseTileData = try? jsonDecoder.decode([ExerciseSet].self, from: data) {
                            completion(exerciseTileData[0])
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchExerciseSetData(completion : @escaping ((ExerciseSet) -> ())) {
        if let url = URL(string: APIEndpoints.exerciseTileURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let exerciseTileData = try? jsonDecoder.decode([ExerciseSet].self, from: data) {
                            completion(exerciseTileData[0])
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
}
