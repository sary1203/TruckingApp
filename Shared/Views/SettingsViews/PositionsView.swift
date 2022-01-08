//
//  PositionsView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

import SwiftUI

struct PositionsView: View {
    let names = ["CEO", "Propietor", "Admin", "Driver", "Helper"]
    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
        }
        .navigationBarTitle("Positions")
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
}

struct PositionsView_Previews: PreviewProvider {
    static var previews: some View {
        PositionsView()
    }
}
