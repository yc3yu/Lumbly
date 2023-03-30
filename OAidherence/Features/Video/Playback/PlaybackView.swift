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
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(edges: [.horizontal, .bottom])

            Text("Immediately after recording, the video will play back here. Press 'Submit' to continue.\n\n(This view is to be updated.)")
                .font(.bodyBold)
                .foregroundColor(.blueCharcoal)
                .multilineTextAlignment(.center)
        }
        .navigationBarItems(trailing: NavigationLink(destination: PainLevelRatingView()) {
            Text(L10n.NavigationBarItem.submit)
        })
    }
}
