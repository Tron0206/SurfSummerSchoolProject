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
    var items = ItemStorage.shared.items
    var errorDescription: String?
    
}

//MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    
    func showDetailViewController(for indexPath: IndexPath) {
        router?.showDetailModule(item: items[indexPath.item])
    }
    
    func loadPosts(_ completion: @escaping () -> Void) {
        getPictures(completion)
    }
    
    func showSearchViewController() {
        router?.showSearchModule(items: items)
    }
    
    func changeFavoriteStatus(for indexPath: IndexPath, isFavorite: Bool) {
        let currentItem = items[indexPath.item]
        favoriteService.changeStatus(id: currentItem.id, isFavorite: isFavorite)
    }
}

//MARK: - Private methods

private extension MainPresenter {

    func getPictures(_ completinHandler: @escaping () -> Void) {
        pictureService.loadPictures { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let pictures):
                DispatchQueue.main.async {
                    self.items = pictures.map({ picture in
                        print(picture.publicationDate)
                        return ItemModel(pictureResponse: picture, isFavorite: self.favoriteService.isFavoriteItem(id: picture.id))
                    })
                    completinHandler()
                }
                
            case .failure(let error):
                self.errorDescription = error.localizedDescription
                DispatchQueue.main.async {
                    completinHandler()
                }
            }
        }
    }
}
