//
//  AppDelegate.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: DriversViewController())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

