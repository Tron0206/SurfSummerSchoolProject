//
//  MainPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


class MainPresenter {
    
    //MARK: - Properties
    
    weak var view: MainViewInput?
    var router: MainRouterInput?
    let pictureService: PicturesService = .init()
    let favoriteService = FavoriteService.shared
    var itemStorage = ItemStorage.shared
    var errorDescription: String?    
}

//MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    
    func reloadCollectionView() {
        view?.reload()
    }
    
    func showDetailViewController(for indexPath: IndexPath) {
        router?.showDetailModule(item: itemStorage.items[indexPath.item])
    }
    
    func loadPosts(_ completion: @escaping () -> Void) {
        getPictures(completion)
    }
    
    func showSearchViewController() {
        router?.showSearchModule()
    }
    
    func changeFavoriteStatus(for indexPath: IndexPath, isFavorite: Bool) {
        let currentItem = itemStorage.items[indexPath.item]
        itemStorage.items[indexPath.item].isFavorite = isFavorite
        favoriteService.changeStatus(id: currentItem.id, isFavorite: isFavorite)
    }
}

//MARK: - Private methods

private extension MainPresenter {

    func getPictures(_ completionHandler: @escaping () -> Void) {
        pictureService.loadPictures { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let pictures):
                DispatchQueue.main.async {
                    self.itemStorage.items = pictures.map({ picture in
                        return ItemModel(pictureResponse: picture, isFavorite: self.favoriteService.isFavoriteItem(id: picture.id))
                    })
                    completionHandler()
                }
                
            case .failure(let error):
                self.errorDescription = error.localizedDescription
                DispatchQueue.main.async {
                    completionHandler()
                }
            }
        }
    }
}
