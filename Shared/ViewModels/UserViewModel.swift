//
//  UserViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/6/22.
//

import AuthenticationServices

final class UserViewModel: ObservableObject {
    
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func onAuthSuccess(_ result:Result<ASAuthorization, Error>) {
        switch result {
            // Auth Success
            case .success(let authResults):

                switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                    if let user = UserModel(credentials: appleIDCredential) {
                        
                        // save User records to CloudKit
                        repository
                            .registerNewUser(
                                user: user,
                                userAppleId: appleIDCredential.user) { result in
                                    
                        }
                        
                            // Change login state
                            //self.login = true
                        } else {
                            // For returning user to signin,
                            // fetch the saved records from Cloudkit
                            /*let privateDatabase = CKContainer(identifier: "iCloud.trucking.signin").privateCloudDatabase
                            privateDatabase.fetch(withRecordID: CKRecord.ID(recordName: appleIDCredential.user)) { (record, error) in
                                 if let fetchedInfo = record {
                                     let email = fetchedInfo["email"] as? String
                                     let firstName = fetchedInfo["firstName"] as? String
                                     let lastName = fetchedInfo["lastName"] as? String
                                     // Save to local
                                     
                                     let userFetched = UserModel(
                                        userId: String(describing: record?.recordID) ,
                                        email: email ?? "",
                                        firstName: firstName ?? "",
                                        lastName: lastName ?? ""
                                     )
                                     
                                     let userData = try? JSONEncoder().encode(userFetched)
                                     UserDefaults.standard.setValue(userData, forKey: String(describing: record?.recordID))
                                     
                                     // Change login state
                                     self.login = true
                                 }
                                
                                if let user = UserModel(credentials: appleIDCredential) {
                                    print("name \(user.firstName) lastname: \(user.lastName) email \(user.email)")
                                } else {
                                    print("UNABLE TO CHAR")
                                }
                                
                             }*/
                    }
                
                // default break (don't remove)
                default:
                    break
                }
            case .failure(let error):
                print("failure", error)
        }
    }
}
