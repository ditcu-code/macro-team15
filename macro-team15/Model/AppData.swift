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
    @AppStorage("isDoneOnboarding") var isDoneOnboarding: Bool = false
    
    @Published var currentBaby: Baby? = nil
}
