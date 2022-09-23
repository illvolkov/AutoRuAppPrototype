//
//  AppDelegate.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 17.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController(nibName: "TabBarController", bundle: nil)
        window?.makeKeyAndVisible()
        
        return true
    }
}

