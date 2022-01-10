//
//  EmployeeView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/9/22.
//

import SwiftUI

struct EmployeeView: View {
    @State private var profileText = " "
    
    var body: some View {
        List {
            nameSection
            noteSection
            vehiclesSection
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Employee Info")
        .toolbar {
            EditButton()
        }
    }
    
    var nameSection: some View {
        Section {
            HStack {
                Text("Name")
                    .font(.callout)
                Spacer()
                Text("Coleen Malayao")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Mobile Number")
                    .font(.callout)
                Spacer()
                Text("09171592281")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("License Number")
                    .font(.callout)
                Spacer()
                Text("DD3JFFEJ455MFF")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            NavigationLink(destination: Text("09/10/2017")){
                HStack {
                    Text("Employment yrs")
                        .font(.callout)
                    Spacer()
                    Text("5")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
            NavigationLink(destination: Text("09/10/1995")){
                HStack {
                    Text("Age")
                        .font(.callout)
                    Spacer()
                    Text("26yrs old")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
            HStack {
                Text("Address")
                    .font(.callout)
                Spacer()
                Text("Cor. Pag-asa village matina aplaya davao city")
                    .font(.callout)
                    .foregroundColor(.secondary)
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
    
    var vehiclesSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("Vehicles can Operate")
                Text("PICKUP , ELF, 4WD")
                    .padding(.bottom, 3)
                    .textSelection(.enabled)
            }
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
    }
}
