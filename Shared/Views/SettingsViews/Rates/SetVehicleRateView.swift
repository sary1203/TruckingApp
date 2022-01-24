//
//  SetVehicleRate.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/17/22.
//

import SwiftUI

struct SetVehicleRateView: View {
    
    @State var selectedCity : Municipality
    @State var selectedVehicleType : VehicleTypeModel
    @ObservedObject var viewModel = VehicleRateViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        let someNumberProxy = Binding<String>(
            get: {
                if (Int64(viewModel.selectedVehicleTypeRate) == 0) {
                    return ""
                }else {
                    return String(Int64(viewModel.selectedVehicleTypeRate))
                }
            },
            set: {
                self.viewModel.selectedVehicleTypeRate = Int64($0) ?? 0
            })
        List {
            Section {
                HStack {
                    Text(selectedVehicleType.vehicleType)
                        .font(.callout)
                    Spacer()
                    /*let vehicleTypeRate : String = $selectedVehicleType.typeRate != 0 ? String($selectedVehicleType.rate) : "0"*/
                    TextField("Php \(selectedVehicleType.typeRate)", text: someNumberProxy)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .foregroundColor(.primary)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                doneButton
            }
        }
    }
    
    private var doneButton: some View {
        return Button(action: {
            print("saving...")
            if (viewModel.selectedVehicleTypeRate != 0) {
                viewModel.saveLocationRate(viewContext: viewContext, selectedCity: selectedCity.wrappedName ,selectedVehicleType: selectedVehicleType.vehicleType) { success in
                    presentationMode.wrappedValue.dismiss()
                }
            }else {
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("Done").padding()
        }
    }
}
