//
//  macro_team15App.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

@main
struct macro_team15App: App {
    @StateObject private var dataController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ProgressShareView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
