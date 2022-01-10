//
//  ClientsViews.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

import SwiftUI

struct ClientsView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    var body: some View {
        List {
            ForEach(searchResults, id: \.self) { name in
                NavigationLink(destination: ClientView()) {
                    Text(name)
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
           /* ForEach(searchResults, id: \.self) { result in
                Text("Are you looking for \(result)?").searchCompletion(result)
            }*/
        }
        .navigationBarTitle("Clients")
        .listStyle(InsetGroupedListStyle())
        .environment(\.horizontalSizeClass, .compact)
        .navigationBarItems(trailing:
            Button(action: {
                print("User icon pressed...")
            }) {
                Image(systemName: "plus.circle").imageScale(.large)
            }
        )
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct ClientsViews_Previews: PreviewProvider {
    static var previews: some View {
        ClientsView()
    }
}
