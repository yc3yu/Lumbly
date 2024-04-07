//
//  APIHandler.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import Foundation
import AZSClient

class APIHandler {
    
    // MARK: Properties
    
    private let containerName: String = "testuser1"
    
    // MARK: Upload data
    
    func uploadVideo(parentExerciseSet: String, exerciseName: String, videoFileURL: URL, completion: @escaping () -> ()) {
        fetchConnectionString() { [weak self] connectionString in
            do {
                guard let containerName = self?.containerName  else {
                    completion()
                    return
                }
                
                let account = try AZSCloudStorageAccount(fromConnectionString: connectionString)
                let blobClient: AZSCloudBlobClient = account.getBlobClient()
                let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: containerName)
                
                blobContainer.createContainerIfNotExists { (error: Error?, exists) -> Void in
                    if error != nil {
                        print("Error creating container")
                        print(error.debugDescription)
                        completion()
                    } else {
                        let fileName = "\(parentExerciseSet)/\(exerciseName)/\(videoFileURL.lastPathComponent)"
                        let blob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: fileName)
                        
                        do {
                            let videoData = try Data(contentsOf: videoFileURL)
                            let videoInputStream = InputStream(data: videoData)
                            blob.upload(from: videoInputStream, completionHandler: { _ in
                                completion()
                            })
                        } catch {
                            print("Error extracting data from URL \(videoFileURL)")
                            completion()
                        }
                    }
                }
            } catch {
                print("Error uploading video")
                completion()
            }
        }
    }
    
    // MARK: Fetch data
    
    func fetchConnectionString(completion: @escaping ((String) -> ())) {
        if let url = URL(string: APIEndpoints.connectionStringURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        if let data = data,
                           let connectionString = String(data: data, encoding: .utf8) {
                            completion(connectionString)
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchHomeData(completion: @escaping ((Home) -> ())) {
        if let url = URL(string: APIEndpoints.homeURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let homeData = try? jsonDecoder.decode(Home.self, from: data) {
                            completion(homeData)
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }

    func fetchExerciseSetData(exerciseSetURL: String?, completion: @escaping ((ExerciseSet) -> ())) {
        if let exerciseSetURL = exerciseSetURL,
           let urlString = exerciseSetURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let exerciseSetData = try? jsonDecoder.decode(ExerciseSet.self, from: data) {
                            completion(exerciseSetData)
                        } else {
                            // TODO: Handle error
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchExerciseInstructionsData(exerciseInstructionsURL: String?, completion: @escaping ((ExerciseInstructions) -> ())) {
        if let url = exerciseInstructionsURL,
           let url = URL(string: url) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let exerciseInstructionsData = try? jsonDecoder.decode(ExerciseInstructions.self, from: data) {
                            completion(exerciseInstructionsData)
                        } else {
                            // TODO: Handle error
                            completion(ExerciseInstructions())
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchResultsDataAvailability(parentExerciseSet: String, exerciseName: String, timestamp: String, completion: @escaping ((ResultsAvailability) -> ())) {
        func makeURL(parentExerciseSet: String, exerciseName: String, timestamp: String) -> String? {
            let urlString = "\(APIEndpoints.containerURL)/results_exist/testuser1/\(parentExerciseSet)/\(exerciseName)/\(timestamp)"
            return urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }

        let urlString = makeURL(parentExerciseSet: parentExerciseSet, exerciseName: exerciseName, timestamp: timestamp)
        if let urlString = urlString,
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                        completion(ResultsAvailability(status: .error))
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let results = try? jsonDecoder.decode(ResultsAvailability.self, from: data) {
                            completion(results)
                        } else {
                            completion(ResultsAvailability(status: .error))
                        }
                    }
                }
            }).resume()
        } else {
            completion(ResultsAvailability(status: .error))
        }
    }

    func fetchResultsData(parentExerciseSet: String, exerciseName: String, timestamp: String, completion: @escaping ((Results) -> ())) {
        func makeURL(parentExerciseSet: String, exerciseName: String, timestamp: String) -> String? {
            let urlString = "\(APIEndpoints.containerURL)/results/testuser1/\(parentExerciseSet)/\(timestamp)"
            return urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }
        
        let urlString = makeURL(parentExerciseSet: parentExerciseSet, exerciseName: exerciseName, timestamp: timestamp)
        if let urlString = urlString,
           let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        // TODO: Handle error
                    } else {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        // TODO: Change from array of Results to just single Results object (both here and in API server)
                        
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
