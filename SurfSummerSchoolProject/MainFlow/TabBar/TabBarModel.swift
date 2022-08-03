//
//  TabBarModel.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import Foundation
import UIKit


enum TabBarModel {
    case main
    case favorite
    case profile
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .favorite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .main: return UIImage(named: "MainTab")
        case .favorite: return UIImage(named: "FavoriteTab")
        case .profile: return UIImage(named: "ProfileTab")
        }
    }
}
