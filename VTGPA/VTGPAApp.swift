//
//  VTGPAApp.swift
//  VTGPA
//
//  Created by Pranav Chavvakula on 4/30/22.
//

import SwiftUI

@main
struct VTGPAApp: App {
    let persistenceController = PersistenceController.shared
    init() {
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
