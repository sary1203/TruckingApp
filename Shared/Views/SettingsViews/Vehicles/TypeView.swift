//
//  TypeView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/15/22.
//

import SwiftUI

struct TypeView: View {
    
    @State var selectedType : String
    @ObservedObject var viewModel = ModifyVehicleTypesViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Type")
                        .font(.callout)
                    TextField(selectedType != "" ? selectedType : "type vehicle type here", text: $viewModel.selectedType)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationTitle("Vehicle Type")
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    if selectedType != "" {
                        deleteButton
                    }
                    doneButton
                }
            }
        }
    }
    
    private var doneButton: some View {
        return Button(action: {
            print("saving...")
            if (viewModel.selectedType != "") {
                viewModel.updateVehicleType(viewContext: viewContext, newType: viewModel.selectedType, oldType: selectedType) { success in
                    print("saving success \(success)")
                    presentationMode.wrappedValue.dismiss()
                }
            }else {
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Text("Done")
        }
    }
    
    private var deleteButton: some View {
        return Button(action: deleteType) {
            Image(systemName: "trash")
                .frame(width: 45, height: 45)
                .foregroundColor(.red)
        }
    }
    
    private func deleteType() {
        viewModel.deleteVehicleType(viewContext: viewContext, selectedType: selectedType) { success in
            print("delete success \(success)")
            presentationMode.wrappedValue.dismiss()
        }
    }
}
