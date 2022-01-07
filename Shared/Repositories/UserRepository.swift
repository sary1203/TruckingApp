//
//  UserRepository.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/6/22.
//

import Foundation

protocol UserRepositoryProtocol {
    func registerNewUser(user: UserModel, userAppleId: String, completion: @escaping (String?) -> Void)
    func fetchUserFromCloud(userAppleId: String ,completion: @escaping (Data?, String?) -> Void)
    func saveUserToLocal(userData: Data, userKey: String)
    func fetchUserFromLocal() -> String
}

final class UserRepository: UserRepositoryProtocol {
    private let apiService: UserApiServiceProtocol
    
    init(apiService: UserApiServiceProtocol = UserApiService()) {
        self.apiService = apiService
    }
    
    func registerNewUser(user: UserModel, userAppleId: String, completion: @escaping (String?) -> Void) {
        apiService.registerNewUser(user: user, userAppleId: userAppleId, completion: completion)
    }
    
    func fetchUserFromCloud(userAppleId: String, completion: @escaping (Data?, String?) -> Void) {
        apiService.fetchUserFromCloud(userAppleId: userAppleId, completion: completion)
    }
    
    func saveUserToLocal(userData: Data, userKey: String) {
        apiService.saveUserToLocal(userData: userData, userKey: userKey)
    }
    
    func fetchUserFromLocal() -> String {
        return apiService.fetchUserFromLocal()
    }
    
    
}
