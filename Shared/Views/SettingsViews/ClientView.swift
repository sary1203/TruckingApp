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
            noteSection
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
                Text("Name")
                    .font(.callout)
                Spacer()
                Text("Randy Flores Jr")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Company")
                    .font(.callout)
                Spacer()
                Text("Cavista Philippines")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("Nickname")
                    .font(.callout)
                Spacer()
                Text("RJ")
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
                Text("Email")
                    .font(.callout)
                Spacer()
                Text("floresrandyjr@gmail.com")
                    .font(.callout)
                    .foregroundColor(.secondary)
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
}

struct ClientView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView()
    }
}
