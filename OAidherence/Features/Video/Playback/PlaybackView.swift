//
//  PlaybackView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-18.
//

import AVKit
import SwiftUI

struct PlaybackView: View {
    @State private var player = AVPlayer()
    
    var viewModel: PlaybackViewModel
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear() {
                player = AVPlayer(url: viewModel.videoFileURL)
                player.play()
            }
            .navigationBarItems(trailing: NavigationLink(destination: PainLevelRatingView()) {
                Text(L10n.NavigationBarItem.submit)
            }.simultaneousGesture(TapGesture().onEnded {
                viewModel.uploadVideo()
            }))
    }
}
