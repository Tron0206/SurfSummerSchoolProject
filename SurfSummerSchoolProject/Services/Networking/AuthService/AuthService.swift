//
//  AuthService.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


struct AuthService {
    let dataTask = BaseNetworkTask<AuthRequestModel, AuthResponseModel>(isNeedInjectToken: false, method: .post, path: "/auth/login")
    
    func performLoginRequest(
        credentials: AuthRequestModel,
        _ onResponseWasReceived: @escaping (_ result: Result<AuthResponseModel, Error>) -> Void) {
            dataTask.performRequest(input: credentials, onResponseWasReceived)
    }
}
