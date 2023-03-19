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
    
    var videoFileURL: URL
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear() {
                player = AVPlayer(url: videoFileURL)
                player.play()
            }
    }
}
