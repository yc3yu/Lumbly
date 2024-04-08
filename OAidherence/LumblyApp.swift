//
//  LumblyApp.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

@main
struct LumblyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
