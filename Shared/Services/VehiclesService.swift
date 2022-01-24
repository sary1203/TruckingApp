//
//  VehiclesService.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/15/22.
//

import CoreData

protocol VehiclesServiceProtocol {
    func loadVehicleTypes(viewContext: NSManagedObjectContext, completion: ([VehicleTypes]) -> ())
    func updateVehicleType(viewContext: NSManagedObjectContext, newType: String, selectedType: String, completion: (Bool) -> ())
    func deleteVehicleType(viewContext: NSManagedObjectContext, selectedType: String, completion: (Bool) -> ())
}

final class VehiclesService: VehiclesServiceProtocol {
    func loadVehicleTypes(viewContext: NSManagedObjectContext, completion: ([VehicleTypes]) -> ()) {
        let fetchRequest = NSFetchRequest<VehicleTypes>(entityName: "VehicleTypes")
        do{
            let types = try viewContext.fetch(fetchRequest)
            if !types.isEmpty {
                print("vehicle types are not empty")
                completion(types)
            }else {
                print("vehicle types is empty")
                completion([])
            }
          } catch {
              print("vehicle types is empty")
              print(error)
              completion([])
          }
    }
    
    func updateVehicleType(viewContext: NSManagedObjectContext, newType: String, selectedType: String, completion: (Bool) -> ()) {
        let fetchRequest = NSFetchRequest<VehicleTypes>(entityName: "VehicleTypes")
        do {
            if selectedType.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                let typeRequest = try viewContext.fetch(fetchRequest)
                for type in typeRequest {
                    if type.type == selectedType {
                        type.type = newType
                        PersistenceController.shared.saveContext()
                    }
                }
            } else {
                fetchRequest.predicate = NSPredicate(
                    format: "type LIKE %@", newType
                )
                let typeRequest = try viewContext.fetch(fetchRequest)
                if typeRequest.isEmpty {
                    let newTypeRequest = VehicleTypes(context: viewContext)
                    newTypeRequest.type = newType
                    PersistenceController.shared.saveContext()
                }
            }
             completion(true)
          } catch {
              print(error)
              completion(false)
          }
    }
    
    func deleteVehicleType(viewContext: NSManagedObjectContext, selectedType: String, completion: (Bool) -> ()) {
        let fetchRequest = NSFetchRequest<VehicleTypes>(entityName: "VehicleTypes")
        do {
            fetchRequest.predicate = NSPredicate(
                format: "type LIKE %@", selectedType
            )
            let typeRequest = try viewContext.fetch(fetchRequest)
            if !typeRequest.isEmpty {
                for type in typeRequest {
                    viewContext.delete(type)
                    PersistenceController.shared.saveContext()
                }
            }
             completion(true)
          } catch {
              print(error)
              completion(false)
          }
    }
}
