//
//  ClientView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

import SwiftUI

struct ClientView: View {
    @State private var profileText = " "
    
    var body: some View {
        List {
            nameSection
            contactNumberSection
            emailSection
            noteSection
            addressSection
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
                    Text("Century tuna Corp.")
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
    
    var emailSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 5) {
                Text("email")
                Text("floresrandyjr@gmail.com")
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
}

struct ClientView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView()
    }
}
