//
//  FavoriteModuleConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


class FavoriteModuleConfigurator {
    
    func configure() -> FavoriteViewController {
        let view = FavoriteViewController()
        let presenter = FavoritePresenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
