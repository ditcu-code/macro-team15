//
//  macro_team15App.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

@main
struct macro_team15App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
