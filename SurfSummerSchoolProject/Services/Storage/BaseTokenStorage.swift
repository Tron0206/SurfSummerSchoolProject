//
//  BaseTokenStorage.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import Foundation


struct BaseTokenStorage: TokenStorage {
    func getToken() throws -> TokenContainer {
        return TokenContainer(token: "ab096ef98cebaca24ab584f4414e7c70c76249a9496144c0dc0b3015d9b1820e")
    }
    
    func set(newToken: TokenContainer) throws {}
}
