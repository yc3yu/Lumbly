//
//  HostedRecordingViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import UIKit
import SwiftUI

struct HostedRecordingViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return RecordingViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
