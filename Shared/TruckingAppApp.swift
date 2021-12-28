//
//  TruckingAppApp.swift
//  Shared
//
//  Created by Randy Flores on 12/28/21.
//

import SwiftUI

@main
struct TruckingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
