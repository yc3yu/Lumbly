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
        
        @MainActor func fetchGifData() {
            guard let url = url else {
                loadStatus = .failure
                return
            }
            
            do {
                self.gifData = try Data(contentsOf: url)
                loadStatus = .success
            } catch {
                loadStatus = .failure
            }
        }
    }
}
