//
//  PictureResponseModel.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


struct PictureResponseModel: Decodable {
    let id: String
    let title: String
    let content: String
    let photoUrl: String
    let publicationDate: Int
}
