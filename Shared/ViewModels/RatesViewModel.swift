//
//  RatesViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/13/22.
//

import CoreData

final class RatesViewModel: ObservableObject {
    private let repository: LocationsServiceProtocol
    @Published var cities: [Municipality] = []
    @Published var isLoading = false
    
    init(repository: LocationsServiceProtocol = LocationsService()) {
        self.repository = repository
    }
    
    func loadSavedCoverage(viewContext: NSManagedObjectContext) {
        self.isLoading = true
        DispatchQueue.main.async {
            self.repository.loadSavedCoverage(viewContext: viewContext){ cities in
                self.cities = cities.sorted {
                    var isSorted = false
                    if let first = $0.name, let second = $1.name {
                        isSorted = first < second
                    }
                    return isSorted
                }
                self.isLoading = false
            }
        }
    }
}
