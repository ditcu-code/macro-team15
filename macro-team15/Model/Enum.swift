//
//  Enum.swift
//
//  Created by Aditya Cahyo on 31/10/22.
//

import Foundation

// ContentView
enum Tabs: String, CaseIterable, Identifiable {
    case home, milestone, report
    var id: Self { self }
}
