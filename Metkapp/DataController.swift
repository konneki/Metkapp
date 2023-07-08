//
//  DataController.swift
//  Metkapp
//
//  Created by Daniel Konnek on 27.06.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Metkapp")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }
            
        }
    }
}
