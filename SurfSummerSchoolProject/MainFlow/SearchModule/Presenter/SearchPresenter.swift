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
    var router: SearchRouterInput?
    let favoriteService = FavoriteService.shared
    var items: [ItemModel]
    var filteredItems = [ItemModel]()
    
    init(items: [ItemModel]) {
        self.items = items
    }
    
    func searchPictures(_ searchText: String) {
        filteredItems = []
        filteredItems = items.filter{ $0.title.lowercased().contains(searchText.lowercased())}
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
    
    func showDetailViewController(for indexPath: IndexPath) {
        router?.showDetailModule(item: filteredItems[indexPath.item])
    }
    
    func changeFavoriteStatus(for indexPath: IndexPath, isFavorite: Bool) {
        let currentItem = filteredItems[indexPath.item]
        favoriteService.changeStatus(id: currentItem.id, isFavorite: isFavorite)
    }
}
