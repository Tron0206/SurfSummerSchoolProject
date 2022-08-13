//
//  FavoriteService.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 13/08/22.
//

import Foundation


class FavoriteService {
    private enum KeyForUserDefaults {
        static let favorite = "favorite"
    }
    
    private let storage = UserDefaults.standard
    static let shared = FavoriteService()
    
    private init() {
        getDataFromUserDefaults()
    }
    
    private var savedItems: [Int] = []
    
    func saveFavoriteItem(_ id: String) {
        guard let id = Int(id) else {
            return
        }
        savedItems.append(id)
        saveToUserDefaults()
    }
    
    func removeFavoriteItem(_ id: String) {
        guard let id = Int(id) else {
            return
        }
        savedItems = savedItems.filter({ !($0 == id)})
        saveToUserDefaults()
    }
    
    func isFavoriteItem(id: String) -> Bool {
        guard let id = Int(id) else {
            return false
        }
        return savedItems.contains(id) ? true : false
    }
    
}

//MARK: - Private methods

private extension FavoriteService {

    func saveToUserDefaults() {
        let dataForUserDefaults = try? JSONEncoder().encode(savedItems)
        storage.set(dataForUserDefaults, forKey: KeyForUserDefaults.favorite)
    }
    
    func getDataFromUserDefaults() {
        guard let dataFromUserDefaults = storage.value(forKey: KeyForUserDefaults.favorite) as? Data,
              let items = try? JSONDecoder().decode([Int].self, from: dataFromUserDefaults) else {
            return
        }
        savedItems = items
    }
}
