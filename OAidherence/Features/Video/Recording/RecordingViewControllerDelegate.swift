//
//  RecordingViewControllerDelegate.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-18.
//

import Foundation

protocol RecordingViewControllerDelegate: AnyObject {
    func videoFileUrlSet(_ viewController: RecordingViewController, videoFileURL: URL)
}
