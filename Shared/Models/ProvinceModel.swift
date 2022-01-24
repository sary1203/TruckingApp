//
//  ProvinceModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/13/22.
//

import Foundation

struct ProvinceModel : Hashable{
    var region: String
    var province: String
    
    init(region: String, province: String) {
        self.region = region
        self.province = province
    }
}
