//
//  FavoriteModuleConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


class FavoriteModuleConfigurator {
    
    func configure(model: MainModel) -> FavoriteViewController {
        let view = FavoriteViewController()
        let presenter = FavoritePresenter(model: model)
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
