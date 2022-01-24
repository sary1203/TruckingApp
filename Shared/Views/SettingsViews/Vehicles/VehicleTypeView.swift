//
//  VehicleTypeView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

import SwiftUI

struct VehicleTypeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var isLoading = false
    
    @ObservedObject var viewModel = VehicleTypesViewModel()
    
    var body: some View {
        List(viewModel.types, id: \.self) { type in
            NavigationLink(destination:
                            TypeView(selectedType: type.type ?? "Unknown Type")) {
                Text(type.type ?? "Unknown type")
                    .font(.callout)
            }
        }
        .onAppear(perform: loadVehicleTypes)
        .navigationBarTitle("Vehicle Types")
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing:
                                NavigationLink(destination: TypeView(selectedType: "")) {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 24, height: 24)
        }
        )
    }
    
    func loadVehicleTypes() {
        viewModel.loadVehicleTypes(viewContext: viewContext)
    }
}

struct VehicleTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleTypeView()
    }
}
