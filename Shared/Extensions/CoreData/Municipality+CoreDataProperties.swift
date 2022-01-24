//
//  Municipality+CoreDataProperties.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/23/22.
//
//

import Foundation
import CoreData


extension Municipality {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Municipality> {
        return NSFetchRequest<Municipality>(entityName: "Municipality")
    }

    @NSManaged public var name: String?
    @NSManaged public var provinceOfCity: String?
    @NSManaged public var region: String?
    
    public var wrappedName: String {
        name ?? "Unknown City"
    }
    
    public var wrappedProvince: String {
        provinceOfCity ?? "Unknown Province"
    }
    
    public var wrappedRegion: String {
        region ?? "Unknown Region"
    }
}

extension Municipality : Identifiable {

}
