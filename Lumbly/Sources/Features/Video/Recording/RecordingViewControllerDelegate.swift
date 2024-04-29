//
//  RecordingViewControllerDelegate.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-18.
//

import Foundation

protocol RecordingViewControllerDelegate: AnyObject {
    func videoFileUrlSet(_ viewController: RecordingViewController, fileManager: FileManager, videoFileURL: URL, timestamp: String)
}
