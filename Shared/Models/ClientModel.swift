//
//  ClientModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

struct ClientModel: Codable {
    var firstName: String
    var middleName: String?
    var lastName: String
    var suffix: String?
    var address: String?
    var email: String?
    var notes: String?
    var companyName: String?
    
    init? (firstName: String, middleName: String?, lastName: String, suffix: String?, address: String?, email: String?, notes: String?, companyName: String?) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.suffix = suffix
        self.address = address
        self.email = email
        self.notes = notes
        self.companyName = companyName
    }
}
