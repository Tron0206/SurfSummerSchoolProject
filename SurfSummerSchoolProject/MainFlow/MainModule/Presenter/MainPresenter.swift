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
    var items: [ItemModel] = []
    var errorDescription: String?
    
}

//MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    func showDetailViewController(item: ItemModel) {
        router?.showDetailModule(item: item)
    }
    
    func loadPosts(_ completion: @escaping () -> Void) {
        getPictures(completion)
    }
    
    func showSearchViewController() {
        router?.showSearchModule()
    }
}

//MARK: - Private methods

private extension MainPresenter {

    func getPictures(_ completinHandler: @escaping () -> Void) {
        pictureService.loadPictures { result in
            switch result {
            case .success(let pictures):
                DispatchQueue.main.async {
                    self.items = pictures.map({ picture in
                        return ItemModel(imageUrlString: picture.photoUrl,
                                         title: picture.title,
                                         isFavorite: false, //TODO - Create Service
                                         dataCreation: "15.05.2022",
                                         description: picture.content)
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
