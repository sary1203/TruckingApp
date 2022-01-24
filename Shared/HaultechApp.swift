//
//  TruckingAppApp.swift
//  Shared
//
//  Created by Randy Flores on 12/28/21.
//

import SwiftUI

@main
struct HaultechApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabsView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.saveContext()
        }
    }
}
