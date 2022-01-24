//
//  CitiesViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/12/22.
//

import CoreData

final class CitiesViewModel: ObservableObject {
    private let repository: LocationsServiceProtocol
    @Published var cities: [String] = []
    @Published var isLoading = false
    
    init(repository: LocationsServiceProtocol = LocationsService()) {
        self.repository = repository
    }
    
    func loadCities(viewContext: NSManagedObjectContext, regionString: String, provinceString: String) {
        self.isLoading = true
        DispatchQueue.main.async {
            self.repository.loadCities(viewContext: viewContext, regionString: regionString, provinceString: provinceString){ cities in
                self.cities = cities.sorted()
                self.isLoading = false
            }
        }
    }
    
    func updateCoverage(viewContext: NSManagedObjectContext, regionString: String,selectedCities: [String], provinceString: String, completion: (Bool) -> ()) {
        self.isLoading = true
        self.repository.updateCoverage(viewContext: viewContext,regionString: regionString ,selectedCities: selectedCities, provinceString: provinceString) { success in
            self.isLoading = false
            completion(true)
        }
    }
}
