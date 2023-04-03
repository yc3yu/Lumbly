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
        if let videoFileURL = viewModel.videoFileURL {
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear() {
                    player = AVPlayer(url: videoFileURL)
                    player.play()
                }
                .navigationBarItems(trailing: NavigationLink(destination: PainLevelRatingView(viewModel: .init(recordingViewModel: viewModel.recordingViewModel))) {
                    Text(L10n.NavigationBarItem.submit)
                }.simultaneousGesture(TapGesture().onEnded {
                    viewModel.uploadVideo()
                }))
        } // TODO: Handle error case (show error screen or modal and ask them to retry recording)
    }
}
