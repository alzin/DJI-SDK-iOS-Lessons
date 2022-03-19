//
//  AppDelegate.swift
//  drones
//
//  Created by Ghaith on 2022/02/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    open var productCommManager = ProductCommunicationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        productCommManager.registerApp()
        return true
    }

}
