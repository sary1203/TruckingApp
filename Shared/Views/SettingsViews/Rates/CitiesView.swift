//
//  CitiesView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/12/22.
//

import SwiftUI

struct CitiesView: View {
    
    @State var cities: [String] = []
    @State var selections: [String] = []
    var regionString : String
    var provinceString : String
    @Binding var shouldPopToRootView : Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isLoading = false
    
    @ObservedObject var viewModel = CitiesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.cities, id: \.self) { city in
                MultipleSelectionRow(title: city, isSelected: self.selections.contains(city)) {
                    if self.selections.contains(city) {
                        self.selections.removeAll(where: { $0 == city})
                    } else {
                        self.selections.append(city)
                    }
                }
            }
        }
        .onAppear(perform: loadCities)
        .navigationTitle("Select Cities")
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            Button(action: {
                print("selected cities = \(selections)")
                self.viewModel.updateCoverage(viewContext: viewContext,regionString: regionString ,selectedCities: selections, provinceString: provinceString) { success in
                    print("updating city done")
                    self.shouldPopToRootView = false
                }
            }) {
                Text("Done")
            }
        }
    }
    
    func loadCities() {
        viewModel.loadCities(viewContext: viewContext, regionString: self.regionString, provinceString: self.provinceString)
    }
}
