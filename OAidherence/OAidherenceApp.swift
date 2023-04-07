//
//  OAidherenceApp.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

@main
struct OAidherenceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
