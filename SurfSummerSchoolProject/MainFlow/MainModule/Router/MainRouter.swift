//
//  MainRouter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


class MainRouter: MainRouterInput {
    
    weak var view: ModuleTransitionable?
    
    func showDetailModule(item: ItemModel) {
        view?.push(module: DetailModuleConfigurator().configure(item: item), animated: true, hideTabBar: true)
    }
    
    func showSearchModule(items: [ItemModel]) {
        view?.push(module: SearchModuleConfigurator().configure(items: items), animated: true)
    }
}
