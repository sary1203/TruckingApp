//
//  VehicleTypeModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

struct VehicleTypeModel: Codable {
    var vehicleType: String
    
    init(vehicleType: String) {
        self.vehicleType = vehicleType
    }
}
