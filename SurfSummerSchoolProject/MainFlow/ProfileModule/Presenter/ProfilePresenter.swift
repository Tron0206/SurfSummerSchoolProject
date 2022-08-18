//
//  ProfilePresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 19/08/22.
//

import Foundation


final class ProfilePresenter: ProfileViewOutput {
    
    //MARK: - Properties
    
    weak var view: ProfileViewInput?
    var router: ProfileRouterInput?
    
    //MARK: - ProfileViewOutput
    
    func showAlertController() {
        router?.showAlertModule(output: self)
    }
}

//MARK: - ActionLogoutAcceptModuleOutput

extension ProfilePresenter: ActionLogoutAcceptModuleOutput {
    func logout() {
        print("logout")
    }
}