//
//  LoginPresenter.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 20/08/22.
//

import Foundation


class LoginPresenter: LoginViewOutput {
    
    //MARK: - Properties
    
    weak var view: LoginViewInput?
    
    
    //MARK: - LoginViewOutput
    
    func performLogin(phone: String, password: String, _ completion: @escaping (AuthError?) -> Void) {
        let credentials = AuthRequestModel(phone: phone, password: password)
        AuthService().performLoginRequestAndSaveToken(credentials: credentials) { result in
            switch result {
            case .success(let response):
                print("success")
                completion(nil)
            case .failure(let error):
                print(error.errorDescription)
                completion(error)
            }
        }
    }
}
