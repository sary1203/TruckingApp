//
//  VehicleTypeView.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/8/22.
//

import SwiftUI

struct VehicleTypeView: View {
    let names = ["10Wheelers", "4wd", "Elf", "Boomtruck", "Closed Van"]
    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
        }
        .navigationBarTitle("Vehicle Types")
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

struct VehicleTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleTypeView()
    }
}
