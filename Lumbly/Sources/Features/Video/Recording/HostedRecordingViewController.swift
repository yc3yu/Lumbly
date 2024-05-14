//
//  HostedRecordingViewController.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-16.
//

import UIKit
import SwiftUI
import Combine

struct HostedRecordingViewController: UIViewControllerRepresentable {
    var viewModel: Binding<RecordingView.ViewModel>
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
        private var cancellable: AnyCancellable?
        var viewModelBinding: Binding<RecordingView.ViewModel>
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
        
        init(viewModelBinding: Binding<RecordingView.ViewModel>) {
            self.viewModelBinding = viewModelBinding
        }
        
        func videoFileUrlSet(_ viewController: RecordingViewController, fileManager: FileManager, videoFileURL: URL, timestamp: String) {
            viewModelBinding.fileManager.wrappedValue = fileManager
            viewModelBinding.videoFileURL.wrappedValue = videoFileURL
            viewModelBinding.timestamp.wrappedValue = timestamp
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(viewModelBinding: viewModel)
    }
}
