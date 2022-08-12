//
//  MainViewOutput.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


protocol MainViewOutput: AnyObject {
    var router: MainRouterInput? { get }
    var items: [ItemModel] { get set }
    func showDetailViewController(item: ItemModel)
    func showSearchViewController()
    func loadPosts(_ competion: @escaping () -> Void)
}
