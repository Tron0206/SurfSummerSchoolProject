//
//  HelperStatus.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 14/08/22.
//

import Foundation
import UIKit


enum HelperStatus {
    case noResult
    case writeRequest
    case noFavorites
    
    var title: String {
        switch self {
        case .noResult:
            return "По этому запросу не результатов,\nпопробуйте другой запрос"
        case .writeRequest:
            return "Введите ваш запрос"
        case .noFavorites:
            return "Нет избранных"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .noResult:
            return Icon.noResult
        case .writeRequest:
            return Icon.search
        case .noFavorites:
            return Icon.noResult
        }
    }
}
