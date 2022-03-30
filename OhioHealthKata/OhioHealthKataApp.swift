//
//  OhioHealthKataApp.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/26/22.
//

import SwiftUI

@main
struct OhioHealthKataApp: App {
    
    
    @StateObject private var coreController = CoreController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreController.container.viewContext)
                .environmentObject(ModelData())
        }
    }
}
