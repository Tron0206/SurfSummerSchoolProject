//
//  SearchModuleConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 11/08/22.
//

import Foundation

final class SearchModuleConfigurator {
    
    func configure() -> SearchViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
