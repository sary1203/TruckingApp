//
//  VehicleTypeModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

struct VehicleTypeModel: Hashable {
    var vehicleType: String
    var typeRate: Int64
    
    init(vehicleType: String, typeRate: Int64) {
        self.vehicleType = vehicleType
        self.typeRate = typeRate
    }
}
