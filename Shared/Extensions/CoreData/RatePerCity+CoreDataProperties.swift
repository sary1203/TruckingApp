//
//  RatePerCity+CoreDataProperties.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/23/22.
//
//

import Foundation
import CoreData


extension RatePerCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RatePerCity> {
        return NSFetchRequest<RatePerCity>(entityName: "RatePerCity")
    }

    @NSManaged public var city: String?
    @NSManaged public var rate: Int64
    @NSManaged public var type: String?

    public var wrappedCity: String {
        city ?? "Unknown City"
    }
    
    public var wrappedType: String {
        type ?? "Unknown Type"
    }
}

extension RatePerCity : Identifiable {

}
