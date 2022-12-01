//
//  UserData.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//

import Foundation
import SwiftUI

final class AppData: ObservableObject {
    @AppStorage("currentBabyId") var currentBabyId: String = ""
    @AppStorage("selectedMonth") var selectedMonth: Int = 1
    @AppStorage("isDoneOnboarding") var isDoneOnboarding: Bool = false
    
    @Published var currentBaby: Baby? = nil
    
    static func setSelectedMonth(_ month: Int) {
        UserDefaults.standard.set(month, forKey: "selectedMonth")
    }
}
