//
//  EmployeeModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

struct EmployeeModel: Codable {
    var firstName: String
    var middleName: String?
    var lastName: String
    var suffix: String?
    var address: String?
    var email: String?
    var notes: String?
    var birthDate: String?
    var position: PositionModel
    
    init? (firstName: String, middleName: String?, lastName: String, suffix: String?, address: String?, email: String?, notes: String?, birthDate: String?, position: PositionModel) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.suffix = suffix
        self.address = address
        self.email = email
        self.notes = notes
        self.birthDate = birthDate
        self.position = position
    }
}
