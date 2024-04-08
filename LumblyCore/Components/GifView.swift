//
//  GifView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-21.
//

import JellyGif
import SwiftUI

struct GifView: UIViewRepresentable {
    var url: URL
    var frame: CGRect
    
    func makeUIView(context: Context) -> JellyGifImageView {
        let view = JellyGifImageView(frame: self.frame)
        view.contentMode = .scaleAspectFit
        return view
    }

    func updateUIView(_ uiView: JellyGifImageView, context: Context) {
        uiView.startGif(with: .localPath(url))
    }
}
