//
//  GifViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-02.
//

import SwiftUI

extension GifView {
    class GifViewModel: ObservableObject {
        enum LoadStatus {
            case success
            case failure
            case unknown
        }
        
        @Published var url: URL?
        @Published var gifData: Data?
        @Published var loadStatus: LoadStatus
        
        init(url: URL?) {
            self.url = url
            self.loadStatus = .unknown
        }
        
        func fetchGifData() async {
            guard let url = url else {
                loadStatus = .failure
                return
            }
            
            guard let (gifData, _) = try? await URLSession.shared.data(from: url) else {
                loadStatus = .failure
                return
            }
            
            self.gifData = gifData
            loadStatus = .success
        }
    }
}
