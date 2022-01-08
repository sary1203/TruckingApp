//
//  UserModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/3/22.
//

import Foundation
import AuthenticationServices

struct UserModel : Codable {
    var userId : String
    var firstName : String
    var lastName : String
    var email : String
    
    init? (credentials: ASAuthorizationAppleIDCredential) {
        guard
            let firstName = credentials.fullName?.givenName,
            let lastName = credentials.fullName?.familyName,
            let email = credentials.email
        else { return nil }
        
        self.userId = credentials.user
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init? (userId: String ,email: String, firstName: String, lastName: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.userId = userId
    }
}
