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
            noteSection
            fuelHistorySection
            repairSection
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Vehicle Info")
        .toolbar {
            EditButton()
        }
    }
    
    var nameSection: some View {
        Section {
            HStack {
                Text("Plate Number")
                    .font(.callout)
                Spacer()
                Text("AWA - 12412")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Model")
                    .font(.callout)
                Spacer()
                Text("Isuzu F-Series 2020")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Engine")
                    .font(.callout)
                Spacer()
                Text("6HK1-TCS")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("GVW")
                    .font(.callout)
                Spacer()
                Text("26,000 kg")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Date Acquired")
                    .font(.callout)
                Spacer()
                Text("10/10/2022")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }

    }
    
    var fuelHistorySection: some View {
        Section {
            VStack(alignment: .leading, spacing: 3) {
                NavigationLink(destination: Text("Hello")) {
                    Text("Fuel History")
                        .font(.callout)
                }
            }
        }
    }
    
    var noteSection: some View {
        Section {
            VStack(alignment: .leading) {
                Text("notes")
                    .font(.callout)
                TextEditor(text: $profileText)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            }
        }
    }
    
    var repairSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink(destination: Text("Hello")) {
                    Text("Repair History")
                        .font(.callout)
                }
            }
        }
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
