//
//  SearchViewOutput.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 11/08/22.
//

import Foundation

protocol SearchViewOutput: AnyObject {
    var filteredItems: [ItemModel] { get }
    
    func searchPictures(_ searchText: String)
    func resultIsEmpty() -> Bool
    func showHelperView(_ status: HelperStatus)
    func showCollectionView()
    func showDetailViewController(for indexPath: IndexPath)
}
