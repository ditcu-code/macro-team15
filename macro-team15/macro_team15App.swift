//
//  macro_team15App.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

@main
struct macro_team15App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            AlbumScreen(name: "Ceroy")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
