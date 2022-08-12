//
//  SearchModuleConfigurator.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 11/08/22.
//

import Foundation

final class SearchModuleConfigurator {
    
    func configure(items: [ItemModel]) -> SearchViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter(items: items)
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
