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
    let pictureService = PicturesService()
    var errorDescription: String?
    
    var items: [ItemModel] = []
    
    //MARK: - Methods
    
    func getPictures(_ completinHandler: @escaping () -> Void) {
        pictureService.loadPictures { result in
            switch result {
            case .success(let pictures):
                DispatchQueue.main.async {
                    self.items = pictures.map({ picture in
                        return ItemModel(imageUrlString: picture.photoUrl,
                                         title: picture.title,
                                         isFavorite: false, //TODO - Create Service
                                         dataCreation: "15.05.2022",
                                         description: picture.content)
                    })
                    completinHandler()
                }
                
            case .failure(let error):
                self.errorDescription = error.localizedDescription
                DispatchQueue.main.async {
                    completinHandler()
                }
            }
        }
    }
    
}
