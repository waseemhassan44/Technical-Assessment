//
//  AppDelegate.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 23/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = OrderListingViewController()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

