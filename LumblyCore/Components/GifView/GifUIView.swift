//
//  GifUIView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-05-01.
//

import SwiftUI
import FLAnimatedImage

struct GifUIView: UIViewRepresentable {
    var gifData: Data
    
    private let animatedView: FLAnimatedImageView = {
        let animatedView = FLAnimatedImageView()
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.contentMode = .scaleAspectFit
        
        return animatedView
    }()
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        animatedView.animatedImage = FLAnimatedImage(animatedGIFData: gifData)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) { }
}
