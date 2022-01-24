//
//  VehicleTypes+CoreDataProperties.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/23/22.
//
//

import Foundation
import CoreData


extension VehicleTypes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VehicleTypes> {
        return NSFetchRequest<VehicleTypes>(entityName: "VehicleTypes")
    }

    @NSManaged public var type: String?

    public var wrappedType: String {
        type ?? "Unknown Type"
    }
}

extension VehicleTypes : Identifiable {

}
