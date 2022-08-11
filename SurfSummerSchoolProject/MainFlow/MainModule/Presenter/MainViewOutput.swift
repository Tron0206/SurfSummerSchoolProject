//
//  MainViewOutput.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


protocol MainViewOutput: AnyObject {
    var model: MainModel { get }
    var router: MainRouterInput? { get }
    init(model: MainModel)
    func showDetailViewController(item: ItemModel)
    func showSearchViewController()
    func loadPosts(_ competion: @escaping () -> Void)
}
