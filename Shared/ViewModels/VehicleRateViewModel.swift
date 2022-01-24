//
//  VehicleRateViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/17/22.
//

import CoreData

final class VehicleRateViewModel: ObservableObject {
    private let repository: LocationsServiceProtocol
    @Published var selectedVehicleTypeRate: Int64 = 0
    @Published var isLoading = false
    
    init(repository: LocationsServiceProtocol = LocationsService()) {
        self.repository = repository
    }
    
    func saveLocationRate(viewContext: NSManagedObjectContext, selectedCity: String,selectedVehicleType: String, completion: (Bool) -> ()) {
        self.isLoading = true
        repository.saveVehicleTypeRate(viewContext: viewContext, selectedCity: selectedCity,selectedVehicleType: selectedVehicleType, rate: self.selectedVehicleTypeRate) { success in
            self.isLoading = false
            completion(success)
        }
    }
}
