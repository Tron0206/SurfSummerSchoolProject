//
//  ItemModel.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 10/08/22.
//

import Foundation


struct ItemModel {
    let imageUrlString: String
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let description: String
    
    init(pictureResponse: PictureResponseModel, isFavorite: Bool) {
        imageUrlString = pictureResponse.photoUrl
        title = pictureResponse.title
        self.isFavorite = isFavorite
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"
        dateCreation = formatter.string(from: pictureResponse.date)
        description = pictureResponse.content
    }
}
