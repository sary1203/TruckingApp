//
//  VehicleView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/9/22.
//

import SwiftUI

struct VehicleView: View {
    @State private var profileText = " "
    
    var body: some View {
        List {
            nameSection
            fuelHistorySection
            capacitySection
            noteSection
            repairSection
            aquiredSection
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Client Info")
        .toolbar {
            EditButton()
        }
    }
    
    var nameSection: some View {
        Section {
            HStack {
                ZStack {
                    RoundedRectangle(
                        cornerRadius: 5,
                        style: .continuous
                    )
                        .fill(.blue)
                        .frame(width: 30, height: 30)
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text("AWA - 1234")
                        .font(.body)
                        .padding(.top, 3)
                    Text("Mitsubishi Elf")
                        .font(.subheadline)
                        .padding(.bottom, 3)
                    
                }
            }
        }

    }
    
    var fuelHistorySection: some View {
        Section {
            VStack(alignment: .leading, spacing: 3) {
                Text("Fuel History")
                    .padding()
            }
        }
    }
    
    var capacitySection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("capacity")
                Text("10,000 Tons")
                    .textSelection(.enabled)
            }
        }
    }
    
    var noteSection: some View {
        Section {
            VStack(alignment: .leading) {
                Text("notes")
                TextEditor(text: $profileText)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
        }
    }
    
    var repairSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("Rerair History")
                    .padding()
            }
        }
    }
    
    var aquiredSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("dateAquired")
                Text("10/10/2010 - 5yrs in the company")
                    .textSelection(.enabled)
            }
        }
    }

}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
