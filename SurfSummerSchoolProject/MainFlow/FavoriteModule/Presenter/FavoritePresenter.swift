//
//  FavoritePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


class FavoritePresenter: FavoriteViewOutput {
    weak var view: FavoriteViewInput?
    var router: FavoriteRouterInput?
    let favoriteService = FavoriteService.shared
    var itemStorage = ItemStorage.shared
    var favoriteItems: [ItemModel] = []
    
    func fetchFavoritePictures() {
        favoriteItems = itemStorage.items.filter{ $0.isFavorite }
        view?.reload()
    }
    
    func showAlerController(for indexPath: IndexPath) {
        router?.showAlerModule(output: self, item: favoriteItems[indexPath.item])
    }
}

extension FavoritePresenter: ActionWithPictureModuleOutput {
    func remove(item: ItemModel) {
        favoriteItems = favoriteItems.filter{ !($0.id == item.id) }
        favoriteService.changeStatus(id: item.id, isFavorite: false)
        view?.reload()
    }
}
