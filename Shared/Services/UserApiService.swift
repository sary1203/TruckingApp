//
//  UserApiService.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/5/22.
//

import CloudKit

protocol UserApiServiceProtocol {
    func registerNewUser(user: UserModel, userAppleId: String, completion: @escaping (String?) -> Void)
    func fetchUserFromCloud(userAppleId: String ,completion: @escaping (Data?, String?) -> Void)
    func saveUserToLocal(userData: Data, userKey: String)
    func fetchUserFromLocal() -> String
}

final class UserApiService: UserApiServiceProtocol {
    func saveUserToLocal(userData: Data, userKey: String) {
        UserDefaults.standard.setValue(userData, forKey: userKey)
    }
    
    func fetchUserFromLocal() -> String {
        return (UserDefaults.standard.object(forKey: "userID") as? String ?? "")
    }
    
    func registerNewUser(user: UserModel, userAppleId: String, completion: @escaping (String?) -> Void) {
        
        let record = CKRecord(recordType: "UsersData", recordID: CKRecord.ID(recordName: userAppleId))
        record.setValuesForKeys([
            "email" : user.email,
            "firstName" : user.firstName,
            "lastName" : user.lastName
        ])
        
        let privateDatabase = CKContainer(identifier: "iCloud.trucking.signin").privateCloudDatabase
            privateDatabase.save(record) { recordData, error in
                
                if let error = error {
                    completion("\(error)")
                } else {
                    completion(String(describing: record.recordID))
                }
            }
    }
    
    func fetchUserFromCloud(userAppleId: String, completion: @escaping (Data?,String?) -> Void) {
        let privateDatabase = CKContainer(identifier: "iCloud.trucking.signin").privateCloudDatabase
        privateDatabase.fetch(withRecordID: CKRecord.ID(recordName: userAppleId)) { (record, error) in
             if let fetchedInfo = record {
                 let email = fetchedInfo["email"] as? String
                 let firstName = fetchedInfo["firstName"] as? String
                 let lastName = fetchedInfo["lastName"] as? String
                 
                 let userFetched = UserModel(
                    userId: String(describing: record?.recordID) ,
                    email: email ?? "",
                    firstName: firstName ?? "",
                    lastName: lastName ?? ""
                 )
                 
                 let userData = try? JSONEncoder().encode(userFetched)
                 completion(userData, String(describing: record?.recordID))
             }
        }
    }
}
