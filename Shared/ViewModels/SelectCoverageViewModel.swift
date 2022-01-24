//
//  SelectCoverageViewModel.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/12/22.
//

import CoreData

final class SelectCoverageViewModel: ObservableObject {
    private let repository: LocationsServiceProtocol
    @Published var provinces: [ProvinceModel] = []
    @Published var isLoading = false
    
    init(repository: LocationsServiceProtocol = LocationsService()) {
        self.repository = repository
    }
    
    func loadProvinces(viewContext: NSManagedObjectContext) {
        self.isLoading = true
        DispatchQueue.main.async {
            self.repository.loadRegionAndProvince(viewContext: viewContext){ provinces in
                self.provinces = provinces.sorted { $0.province < $1.province }
                self.isLoading = false
            }
        }
    }
}
