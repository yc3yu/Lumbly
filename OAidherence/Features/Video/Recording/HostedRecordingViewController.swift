//
//  HostedRecordingViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import UIKit
import SwiftUI
import Combine

struct HostedRecordingViewController: UIViewControllerRepresentable {
    let videoFileURL: Binding<URL?>
    
    var viewControllerLink: RecordingViewControllerLink
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = RecordingViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        context.coordinator.viewController = uiViewController as? any RecordingViewControllerLinkable
        context.coordinator.viewControllerLink = viewControllerLink
    }
    
    class Coordinator: RecordingViewControllerDelegate {
        let videoFileURLBinding: Binding<URL?>
        
        private var cancellable: AnyCancellable?
        
        var viewController: RecordingViewControllerLinkable?
        
        var viewControllerLink: RecordingViewControllerLink? {
            didSet {
                cancellable = viewControllerLink?.$action.sink(receiveValue: { (action) in
                    guard let action = action else {
                        return
                    }
                    self.viewController?.action(action)
                })
            }
        }
        
        init(videoFileURLBinding: Binding<URL?>) {
            self.videoFileURLBinding = videoFileURLBinding
        }
        
        func videoFileUrlSet(_ viewController: RecordingViewController, videoFileURL: URL) {
            videoFileURLBinding.wrappedValue = videoFileURL
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(videoFileURLBinding: videoFileURL)
    }
}
