//
//  FavoriteRouter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 15/08/22.
//

import Foundation


class FavoriteRouter: FavoriteRouterInput {
    weak var view: ModuleTransitionable?
    
    func showAlerModule(output: ActionWithPictureModuleOutput, item: ItemModel) {
        let alertController = ActionWithPictureAlertController(title: "Внимание",
                                                               message: "Вы точно хотите удалить\nиз избранного?",
                                                               preferredStyle: .alert)
        alertController.configure(output: output, item: item)
        view?.presentModule(alertController, animated: true, completion: nil)
    }
    
    func showSearchModule() {
        view?.push(module: SearchModuleConfigurator().configure(), animated: true)
    }
}
