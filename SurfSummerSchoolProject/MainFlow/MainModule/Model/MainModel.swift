//
//  MainModel.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 04/08/22.
//

import Foundation
import UIKit

final class MainModel {
    //MARK: - Events
    var didItemsUpdated: (() -> Void)?
    
    //MARK: - Properties
    var items: [ItemModel] = [] {
        didSet {
            didItemsUpdated?()
        }
    }
    
    //MARK: - Methods
    func getPost() {
        items = Array(repeating: ItemModel.createDefault(), count: 100)
    }
    
}

struct ItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dataCreation: String
    let description: String
    
    static func createDefault() -> ItemModel {
        return .init(image: UIImage(named: "Image"), title: "Чашечка свежего кофе", isFavorite: false, dataCreation: "12.05.2022", description: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
    }
}
