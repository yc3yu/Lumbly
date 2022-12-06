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
                        
                        if let data = data,
                           let results = try? jsonDecoder.decode(Results.self, from: data) {
                            completion(results)
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
}
