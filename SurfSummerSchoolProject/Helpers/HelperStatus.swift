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
    
    var title: String {
        switch self {
        case .noResult:
            return "По этому запросу не результатов,\nпопробуйте другой запрос"
        case .writeRequest:
            return "Введите ваш запрос"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .noResult:
            return Icon.noResult
        case .writeRequest:
            return Icon.search
        }
    }
}
