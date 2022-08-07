//
//  TabBarConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import Foundation
import UIKit


class TabBarConfigurator {
    //MARK: - Private property
    private var allTab: [TabBarModel] = [.main, .favorite, .profile]
    
    //MARK: - Internal func
    func configure() -> UITabBarController {
        return getTabBarController()
    }
}

private extension TabBarConfigurator {
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getControllers()
        return tabBarController

    }
    
    func getControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTab.forEach { tab in
            let viewController = getCurrentController(tabBar: tab)
            let navigationController = UINavigationController(rootViewController: viewController)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.image)
            viewController.tabBarItem = tabBarItem
            viewController.title = tab.title
            viewControllers.append(navigationController)
        }
        return viewControllers
    }
    
    func getCurrentController(tabBar: TabBarModel) -> UIViewController {
        let model = MainModel()
        switch tabBar {
        case .main:
            return MainModuleConfigurator().configure(model: model)
        case .favorite:
            return FavoriteViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
