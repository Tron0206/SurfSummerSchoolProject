//
//  MainRouter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


final class MainRouter: MainRouterInput {
    
    weak var view: ModuleTransitionable?
    
    func showDetailModule(item: ItemModel) {
        view?.push(module: DetailModuleConfigurator().configure(item: item), animated: true, hideTabBar: true)
    }
    
    func showSearchModule() {
        view?.push(module: SearchModuleConfigurator().configure(), animated: true)
    }
}
