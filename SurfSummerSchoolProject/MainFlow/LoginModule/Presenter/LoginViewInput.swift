//
//  LoginViewInput.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 20/08/22.
//

import Foundation


protocol LoginViewInput: AnyObject {
    func showWarning(errorDescription: String?)
    func showMainFlow()
    func startLoading()
    func stopLoading()
}
