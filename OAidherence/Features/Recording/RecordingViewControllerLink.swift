//
//  RecordingViewControllerLink.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import Combine

enum RecordingLinkAction {
    case startRecording
    case stopRecording
}

class RecordingViewControllerLink: ObservableObject {
    @Published var action: RecordingLinkAction?
    
    func performAction(action: RecordingLinkAction) {
        self.action = action
        print("\(action)")
    }
}
