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
        fetchData()
    }
}

//MARK: - Private methods

private extension MainPresenter {
    func fetchData() {
        model.getPost()
    }
}
