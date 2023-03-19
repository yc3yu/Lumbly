//
//  APIHandler.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import Foundation

class APIHandler {
    // MARK: Upload data
    
    func uploadVideo(videoFileURL: URL, completion: @escaping () -> ()) {
        guard let azureConnectionString = ProcessInfo.processInfo.environment["AZURE_STORAGE_CONNECTION_STRING"],
        let containerName = ProcessInfo.processInfo.environment["AZURE_TEST_USER_CONTAINER_NAME"] else {
            return
        }
        
        do {
            let account = try AZSCloudStorageAccount(fromConnectionString: azureConnectionString as String)
            let blobClient: AZSCloudBlobClient = account.getBlobClient()
            let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: containerName)

            blobContainer.createContainerIfNotExists { (error: Error?, exists) -> Void in
                if error != nil {
                    print("Error creating container")
                    print(error.debugDescription)
                }
                else {
                    let fileName = "video/\(videoFileURL.lastPathComponent)"
                    let blob: AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: fileName)
                    
                    do {
                        let videoData = try Data(contentsOf: videoFileURL)
                        let videoInputStream = InputStream(data: videoData)
                        blob.upload(from: videoInputStream, completionHandler: { _ in
                            completion()
                        })
                    } catch {
                        print("Error extracting data from URL \(videoFileURL)")
                    }
                }
            }
        } catch {
            print("Error uploading video")
            completion()
        }
    }
    
    // MARK: Fetch data
    
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
                        }
                    }
                }
            }).resume()
        }
    }
    
    func fetchResultsData(completion: @escaping ((Results) -> ())) {
        if let urlString = APIEndpoints.resultsURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
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
