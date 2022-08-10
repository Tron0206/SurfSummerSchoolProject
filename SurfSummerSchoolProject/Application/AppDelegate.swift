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
    var tokenStorage: TokenStorage {
        return BaseTokenStorage()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        startLaunchScreen()
        return true
    }
    
    func startLaunchScreen() {
        runLaunchScreen()
        
        if let tokenContainer = try? tokenStorage.getToken(), !tokenContainer.isExpired {
            runMainFlow()
        } else {
            let tempCredential = AuthRequestModel(phone: "+79876543219", password: "qwerty")
            AuthService().performLoginRequestAndSaveToken(credentials: tempCredential) { result in
                switch result {
                case .success:
                    self.runMainFlow()
                case .failure:
                    //TODO: - Handle error
                    break
                }
            }
        }
    }
    
    func runMainFlow() {
        DispatchQueue.main.async {
            self.window?.rootViewController = TabBarConfigurator().configure()
        }
    }
    
    func runLaunchScreen() {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }
}

