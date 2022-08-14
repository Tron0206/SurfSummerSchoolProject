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
    var favoriteService: FavoriteService { get }
    func showDetailViewController(for indexPath: IndexPath)
    func showSearchViewController()
    func loadPosts(_ competion: @escaping () -> Void)
    func changeFavoriteStatus(for indexPath: IndexPath, isFavorite: Bool)
}
