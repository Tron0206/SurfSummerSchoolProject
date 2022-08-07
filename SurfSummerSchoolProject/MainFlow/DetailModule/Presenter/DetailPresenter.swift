//
//  DetailPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 08/08/22.
//

import Foundation


class DetailPresenter: DetailViewOutput {
    weak var view: DetailViewInput?
    var item: ItemModel
    
    required init(item: ItemModel) {
        self.item = item
    }
}
