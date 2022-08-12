//
//  SearchPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 11/08/22.
//

import Foundation


class SearchPresenter: SearchViewOutput {
    
    //MARK: - Properties
    
    weak var view: SearchViewInput?
    var items: [ItemModel]
    
    init(items: [ItemModel]) {
        self.items = items
    }
}
