//
//  SetLocationRateViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/13/22.
//

import CoreData

final class SetLocationRateViewModel: ObservableObject {
    private let repository: LocationsServiceProtocol
    @Published var selectedCityRate: Int64 = 0
    @Published var isLoading = false
    @Published var vehicleTypes: [VehicleTypeModel] = []
    
    init(repository: LocationsServiceProtocol = LocationsService()) {
        self.repository = repository
    }
    
    func loadVehicleTypes(viewContext: NSManagedObjectContext, selectedCity: String) {
        DispatchQueue.main.async {
            self.isLoading = true
            self.repository.loadVehicleTypes(viewContext: viewContext,selectedCity: selectedCity) { vehicleTypes in
                self.vehicleTypes = vehicleTypes
                self.isLoading = false
            }
        }
    }
    
    func deleteCity(viewContext: NSManagedObjectContext, selectedCity: String, completion: (Bool) -> ()) {
        self.isLoading = true
        repository.deleteCity(viewContext: viewContext, selectedCity: selectedCity) { success in
            self.isLoading = false
            completion(success)
        }
    }
}
