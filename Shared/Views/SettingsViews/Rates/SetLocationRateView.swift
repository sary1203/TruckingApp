//
//  SetLocationRateView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/13/22.
//

import SwiftUI

struct SetLocationRateView: View {
    
    @State var selectedCity : Municipality
    @ObservedObject var viewModel = SetLocationRateViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        ZStack {
            Section {
                List(viewModel.vehicleTypes, id:\.self) { vehicleType in
                    NavigationLink(destination: SetVehicleRateView(selectedCity: selectedCity, selectedVehicleType: vehicleType)) {
                        HStack {
                            Text(vehicleType.vehicleType)
                                .font(.callout)
                            Spacer()
                            Text("Php \(vehicleType.typeRate)")
                        }
                    }
                }
                .navigationBarTitle(selectedCity.wrappedName)
                .onAppear(perform: loadVehicleTypes)
                .listStyle(InsetGroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        deleteButton
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        doneButton
                    }
                }
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
    
    private func loadVehicleTypes() {
        viewModel.loadVehicleTypes(viewContext: viewContext, selectedCity: selectedCity.wrappedName)
    }
    
    private var doneButton: some View {
        return Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Done").font(.callout).padding().fixedSize()
        }.fixedSize()
    }
    
    private var deleteButton: some View {
        return Button(action: deleteCity) {
            Image(systemName: "trash")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.red)
        }
    }
    
    private func deleteCity() {
        viewModel.deleteCity(viewContext: viewContext, selectedCity: selectedCity.wrappedName) { success in
            print("delete success \(success)")
            presentationMode.wrappedValue.dismiss()
        }
    }
}
