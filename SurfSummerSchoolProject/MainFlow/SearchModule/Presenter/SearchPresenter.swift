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
    var filteredItems = [ItemModel]()
    
    init(items: [ItemModel]) {
        self.items = items
    }
    
    func searchPictures(_ searchText: String) {
        filteredItems = []
        filteredItems = items.filter{ $0.title.contains(searchText)}
        if !filteredItems.isEmpty {
            view?.reload()
        }        
    }
    
    func resultIsEmpty() -> Bool {
        return filteredItems.isEmpty
    }
    
    func showHelperView(_ status: HelperStatus) {
        view?.showHelper(status)
    }
    
    func showCollectionView() {
        view?.showCollection()
    }
}
