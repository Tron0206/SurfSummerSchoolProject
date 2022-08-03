//
//  SceneDelegate.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 02/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        goToMain()
        window?.makeKeyAndVisible()
    }
    
    func goToMain() {
        window?.rootViewController = TabBarConfigurator().configure()
    }

}

