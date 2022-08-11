//
//  FavoritePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


class FavoritePresenter: FavoriteViewOutput {
    weak var view: FavoriteViewInput?
    var model = MainModel.shared
}
