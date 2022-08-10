//
//  AppDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 02/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        runMainFlow()
        return true
    }
    
    func runMainFlow() {
        window?.rootViewController = TabBarConfigurator().configure()
    }
}

