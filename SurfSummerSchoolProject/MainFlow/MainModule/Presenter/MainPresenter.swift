//
//  MainPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


class MainPresenter: MainViewOutput {
    weak var view: MainViewInput?
    var router: MainRouterInput?
    var model: MainModel
    
    required init(model: MainModel) {
        self.model = model
    }
    
    func showDetail(item: ItemModel) {
        router?.showDetailModule(item: item)
    }
    
    func loadPosts(_ completion: @escaping () -> Void) {
        model.getPictures(completion)
    }
}

//MARK: - Private methods

private extension MainPresenter {

}
