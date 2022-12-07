//
//  AppDelegate.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 05/12/22.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //TODO: Additional Step 3
        configureUserNotification()
        return true
    }
}

//TODO: Additional Step 1
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
    
    private func configureUserNotification(){
        UNUserNotificationCenter.current().delegate = self
    }
}

