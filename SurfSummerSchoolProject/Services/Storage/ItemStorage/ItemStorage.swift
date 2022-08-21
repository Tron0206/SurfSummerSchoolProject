//
//  ItemStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 12/08/22.
//

import Foundation


class ItemStorage {
    var items: [ItemModel] = []
    static let shared = ItemStorage()
    private init() {}
    
}
