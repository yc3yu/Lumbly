//
//  ViewControllerLink.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import Combine

enum LinkAction {
    case startRecording
    case stopRecording
}

class ViewControllerLink: ObservableObject {
    @Published var action: LinkAction?
    
    func performAction(action: LinkAction) {
        self.action = action
        print("\(action)")
    }
}
