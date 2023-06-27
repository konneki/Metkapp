//
//  MetkappApp.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

@main
struct MetkappApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
