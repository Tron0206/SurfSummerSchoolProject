//
//  MainViewOutput.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import Foundation


protocol MainViewOutput: AnyObject {
    var model: MainModel { get }
    init(model: MainModel)
}
