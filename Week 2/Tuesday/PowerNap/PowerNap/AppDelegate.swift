//
//  AppDelegate.swift
//  PowerNap
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound
        ]) { (success, _) in
            if success {
                print("User allowed us to send alerts")
            }
        }
        
        return true
    }
}

