//
//  AppDelegate.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-04-06.
//

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?)
    -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
