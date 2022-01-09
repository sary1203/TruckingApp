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
            contactNumberSection
            licenseSection
            birthdateSection
            noteSection
            joinedSection
            addressSection
            vehiclesSection
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
                    Text("Randy Flores Jr")
                        .font(.body)
                        .padding(.top, 3)
                    Text("Driver")
                        .font(.subheadline)
                    Text("RJ")
                        .font(.subheadline)
                        .padding(.bottom, 3)
                    
                }
            }
        }

    }
    
    var contactNumberSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 3) {
                Text("mobile")
                Text("09171592281")
                    .textSelection(.enabled)
            }
        }
    }
    
    var licenseSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("license number")
                Text("DD3JFFEJ455MFF")
                    .textSelection(.enabled)
            }
        }
    }
    
    var joinedSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("Date Joined")
                Text("09/29/1995 - 26yrs in the company")
                    .textSelection(.enabled)
            }
        }
    }
    
    var birthdateSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("Date of Birth")
                Text("09/29/1995 - 26yrs yrs old")
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
    
    var addressSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("address")
                Text("Cord. Pag-asa village matina aplaya davao city")
                    .padding(.bottom, 3)
                    .textSelection(.enabled)
            }
        }
    }
    
    var vehiclesSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 0) {
                Text("Vehicles")
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
