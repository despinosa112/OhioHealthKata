//
//  CoreController.swift
//  OhioHealthKata
//
//  Created by Daniel Espinosa on 3/29/22.
//

import CoreData
import Foundation

class CoreController: ObservableObject {
    
    let container = NSPersistentContainer(name: "CoreItems")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load ERROR: \(error.localizedDescription)")
            }
        }
    }
    
}
