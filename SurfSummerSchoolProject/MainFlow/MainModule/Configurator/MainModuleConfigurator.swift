//
//  MainModuleConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation
import UIKit


final class MainModuleConfigurator {
    
    func configure(model: MainModel) -> MainViewController {
        let view = MainViewController()
        let presenter = MainPresenter(model: model)
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        return view
    }
}
