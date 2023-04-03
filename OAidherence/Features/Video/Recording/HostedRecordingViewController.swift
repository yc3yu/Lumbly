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
    let timestamp: Binding<String?>
    
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
        let timestampBinding: Binding<String?>
        
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
        
        init(videoFileURLBinding: Binding<URL?>, timestampBinding: Binding<String?>) {
            self.videoFileURLBinding = videoFileURLBinding
            self.timestampBinding = timestampBinding
        }
        
        func videoFileUrlSet(_ viewController: RecordingViewController, videoFileURL: URL, timestamp: String) {
            videoFileURLBinding.wrappedValue = videoFileURL
            timestampBinding.wrappedValue = timestamp
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(videoFileURLBinding: videoFileURL, timestampBinding: timestamp)
    }
}
