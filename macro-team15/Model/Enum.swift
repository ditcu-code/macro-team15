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

enum MilestoneCategory: String, CaseIterable {
    case motoric = "Motorik"
    case cognitive = "Kognitif"
    case social = "Sosial & Emosional"
    case language = "Bahasa"
}

enum StimulusType: String, CaseIterable {
    case activity = "Aktivitas"
    case information = "Informasi"
}
