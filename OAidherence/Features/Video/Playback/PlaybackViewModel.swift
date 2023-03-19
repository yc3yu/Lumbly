//
//  PlaybackViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel {
        private var apiHandler: APIHandler
        
        var videoFileURL: URL
        
        init(videoFileURL: URL) {
            self.apiHandler = APIHandler()
            self.videoFileURL = videoFileURL
        }
        
        func uploadVideo() {
            apiHandler.uploadVideo(videoFileURL: videoFileURL) { [weak self] in
                if let videoFileURL = self?.videoFileURL {
                    let path = videoFileURL.path
                    
                    guard FileManager.default.fileExists(atPath: path) else { return }
                    
                    do {
                        try FileManager.default.removeItem(atPath: path)
                        //for testing
                    } catch {
                        print("Error removing file at url: \(videoFileURL)")
                    }
                }
            }
        }
    }
}
