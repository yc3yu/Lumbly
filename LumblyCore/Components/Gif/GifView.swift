//
//  GifView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-01.
//

import SwiftUI

struct GifView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Group {
            if viewModel.loadStatus == .success,
               let gifData = viewModel.gifData {
                GifUIView(gifData: gifData)
            } else if viewModel.loadStatus == .unknown {
                ProgressView()
            } else {
                ErrorLoadingContentView(errorText: L10n.ErrorLoadingContentView.contentError)
            }
        }
        .onAppear {
            viewModel.fetchGifData()
        }
    }
}
