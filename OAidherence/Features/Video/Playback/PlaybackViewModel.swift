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
    }
}
