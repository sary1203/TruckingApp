//
//  ModifyVehicleTypesViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/15/22.
//

import CoreData

final class ModifyVehicleTypesViewModel: ObservableObject {
    private let repository: VehiclesServiceProtocol
    @Published var selectedType: String = ""
    @Published var isLoading = false
    
    init(repository: VehiclesServiceProtocol = VehiclesService()) {
        self.repository = repository
    }
    
    func updateVehicleType(viewContext: NSManagedObjectContext, newType: String, oldType: String,completion: (Bool) -> ()) {
        self.isLoading = true
        repository.updateVehicleType(viewContext: viewContext, newType: newType, selectedType: oldType) { success in
            self.isLoading = false
            completion(success)
        }
    }
    
    func deleteVehicleType(viewContext: NSManagedObjectContext, selectedType: String, completion: (Bool) -> ()) {
        self.isLoading = true
        repository.deleteVehicleType(viewContext: viewContext, selectedType: selectedType) { success in
            self.isLoading = false
            completion(success)
        }
    }
}
