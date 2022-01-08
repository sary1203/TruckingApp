//
//  PositionModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

struct PositionModel: Codable {
    var position: String
    
    init(position: String) {
        self.position = position
    }
}
