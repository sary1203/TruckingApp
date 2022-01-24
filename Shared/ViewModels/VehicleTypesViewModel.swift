//
//  VehicleTypesViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/15/22.
//

import CoreData

final class VehicleTypesViewModel: ObservableObject {
    private let repository: VehiclesServiceProtocol
    @Published var types: [VehicleTypes] = []
    @Published var isLoading = false
    
    init(repository: VehiclesServiceProtocol = VehiclesService()) {
        self.repository = repository
    }
    
    func loadVehicleTypes(viewContext: NSManagedObjectContext) {
        self.isLoading = true
        DispatchQueue.main.async {
            self.repository.loadVehicleTypes(viewContext: viewContext){ types in
                self.types = types.sorted {
                    var isSorted = false
                    if let first = $0.type, let second = $1.type {
                        isSorted = first < second
                    }
                    return isSorted
                }
                self.isLoading = false
            }
        }
    }
}
