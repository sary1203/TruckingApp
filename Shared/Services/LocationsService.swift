//
//  LocationsService.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/11/22.
//

import CoreData
import SwiftyJSON
import SwiftUI

protocol LocationsServiceProtocol {
    func loadRegionAndProvince(viewContext: NSManagedObjectContext, completion: ([ProvinceModel]) -> ())
    func loadCities(viewContext: NSManagedObjectContext, regionString: String ,provinceString: String, completion: ([String]) -> ())
    func updateCoverage(viewContext: NSManagedObjectContext, regionString: String, selectedCities: [String], provinceString: String, completion: (Bool) -> ())
    func loadSavedCoverage(viewContext: NSManagedObjectContext, completion: ([Municipality]) -> ())
    func saveVehicleTypeRate(viewContext: NSManagedObjectContext, selectedCity: String, selectedVehicleType: String, rate: Int64, completion: (Bool) -> ())
    func deleteCity(viewContext: NSManagedObjectContext, selectedCity: String, completion: (Bool) -> ())
    func loadVehicleTypes(viewContext: NSManagedObjectContext, selectedCity: String, completion: ([VehicleTypeModel]) -> ())
}

final class LocationsService: LocationsServiceProtocol {
    
    func loadVehicleTypes(viewContext: NSManagedObjectContext, selectedCity: String,completion: ([VehicleTypeModel]) -> ()) {
        
        let fetchRequestRatePerCity = RatePerCity.fetchRequest()
        var vehicleTypesArray : [VehicleTypeModel] = []
        var vehicleTypesComparisonArray : [String] = []
        
        fetchRequestRatePerCity.predicate = NSPredicate(
            format: "city LIKE %@", selectedCity
        )
        
        do{
            let ratePerCityRequest = try viewContext.fetch(fetchRequestRatePerCity)
            if !ratePerCityRequest.isEmpty {
                let fetchRequestTypes = VehicleTypes.fetchRequest()
                let typesRequest = try viewContext.fetch(fetchRequestTypes)
                
                if !typesRequest.isEmpty {
                    for item in ratePerCityRequest {
                        let newItem = VehicleTypeModel(vehicleType: item.wrappedType, typeRate: item.rate)
                        if !vehicleTypesArray.contains(newItem) {
                            vehicleTypesArray.append(newItem)
                            vehicleTypesComparisonArray.append(item.wrappedType)
                        }
                    }
                    for type in typesRequest {
                        if !vehicleTypesComparisonArray.contains(type.wrappedType) {
                            vehicleTypesArray.append(VehicleTypeModel(vehicleType: type.wrappedType, typeRate: 0))
                            vehicleTypesComparisonArray.append(type.wrappedType)
                        }
                    }
                }
                completion(vehicleTypesArray)
            } else {
                let fetchRequestTypes = VehicleTypes.fetchRequest()
                let typesRequest = try viewContext.fetch(fetchRequestTypes)
                if !typesRequest.isEmpty {
                    for item in typesRequest {
                        vehicleTypesArray.append(
                            VehicleTypeModel(
                                vehicleType: item.wrappedType,
                                typeRate: 0
                            )
                        )
                    }
                    completion(vehicleTypesArray)
                } else {
                    completion([])
                }
            }
        } catch {
            print(error)
            completion([])
        }
    }
    
    func deleteCity(viewContext: NSManagedObjectContext, selectedCity: String, completion: (Bool) -> ()) {
        let fetchRequest = NSFetchRequest<Municipality>(entityName: "Municipality")
        fetchRequest.predicate = NSPredicate(
            format: "name LIKE %@", selectedCity
        )
        do{
            let test = try viewContext.fetch(fetchRequest)
            if !test.isEmpty {
                for index in test {
                    viewContext.delete(index)
                    PersistenceController.shared.saveContext()
                }
                completion(true)
            } else {
                //print("City not found")
                completion(false)
            }
        } catch {
            print(error)
            completion(false)
        }
    }
    
    func saveVehicleTypeRate(viewContext: NSManagedObjectContext, selectedCity: String, selectedVehicleType: String, rate: Int64, completion: (Bool) -> ()) {
        let fetchRequest = RatePerCity.fetchRequest()
        let predicateCity:NSPredicate = NSPredicate(
            format: "city LIKE %@", selectedCity
        )
        let predicateType:NSPredicate = NSPredicate(
            format: "type LIKE %@", selectedVehicleType
        )
        
        fetchRequest.predicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicateCity,predicateType])
        do{
            let test = try viewContext.fetch(fetchRequest)
            if !test.isEmpty {
                print("1")
                for item in test {
                    if item.wrappedType == selectedVehicleType && item.wrappedCity == selectedCity {
                        item.rate = rate
                        PersistenceController.shared.saveContext()
                        print("Updated rate")
                    }
                }
                completion(true)
            } else {
                print("2")
                let newRatePerCity = RatePerCity(context: viewContext)
                newRatePerCity.city = selectedCity
                newRatePerCity.rate = rate
                newRatePerCity.type = selectedVehicleType
                PersistenceController.shared.saveContext()
                print("New RatePerCity added")
                completion(true)
            }
          } catch {
              print(error)
              completion(false)
          }
    }
    
    func loadSavedCoverage(viewContext: NSManagedObjectContext, completion: ([Municipality]) -> ()) {
        let fetchRequest = NSFetchRequest<Municipality>(entityName: "Municipality")
        do{
            let cities = try viewContext.fetch(fetchRequest)
            if !cities.isEmpty {
                completion(cities)
            }else {
                completion([])
            }
          } catch {
              print(error)
              completion([])
          }
    }
    
    func updateCoverage(viewContext: NSManagedObjectContext, regionString: String, selectedCities: [String], provinceString: String, completion: (Bool) -> ()) {
        let fetchRequest = NSFetchRequest<Municipality>(entityName: "Municipality")
        do{
            for city in selectedCities {
                fetchRequest.predicate = NSPredicate(
                    format: "name LIKE %@", city
                )
                let cityRequest = try viewContext.fetch(fetchRequest)
                if cityRequest.isEmpty {
                    let newCity = Municipality(context: viewContext)
                    newCity.name = city
                    newCity.provinceOfCity = provinceString
                    newCity.region = regionString
                    PersistenceController.shared.saveContext()
                }
            }
            completion(true)
          } catch {
              print(error)
              completion(false)
          }
    }
    
    func loadCities(viewContext: NSManagedObjectContext, regionString: String ,provinceString: String, completion: ([String]) -> ()) {
        var cities : [String] = []
        if let path = Bundle.main.path(forResource: "philippines_municipalities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                
                for (_, subJson) in jsonObj {
                    if (regionString == subJson["region_name"].stringValue) {
                        for (provinceKey, municipalityList) in subJson["province_list"] {
                            if(provinceString == provinceKey) {
                                for(municipalityKey, _) in municipalityList["municipality_list"] {
                                    cities.append(municipalityKey)
                                }
                                continue
                            }
                        }
                    }
                }
                completion(cities)
            } catch let error {
                print("Parse error: \(error.localizedDescription)")
                completion([])
            }
        } else {
            print("Invalid filename/path.")
            completion([])
        }
    }
    
    func loadRegionAndProvince(viewContext: NSManagedObjectContext, completion: ([ProvinceModel]) -> ()) {
        var provinces : [ProvinceModel] = []
        if let path = Bundle.main.path(forResource: "philippines_municipalities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = try JSON(data: data)
                
                for (_, subJson) in jsonObj {
                    for (provinceKey, _) in subJson["province_list"] {
                        let newProvince = ProvinceModel(region: subJson["region_name"].stringValue, province: provinceKey)
                        provinces.append(newProvince)
                    }
                }
                //print("Regions and Provinces saved successfully")
                completion(provinces)
            } catch let error {
                print("Parse error: \(error.localizedDescription)")
                completion([])
            }
        } else {
            print("Invalid filename/path.")
            completion([])
        }
    }
}
