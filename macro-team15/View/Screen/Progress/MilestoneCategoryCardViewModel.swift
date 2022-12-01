//
//  MilestoneCategoryCardViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//

import Foundation
import SwiftUI

class MilestoneCategoryCardViewModel: ObservableObject {
    @Published var appData = AppData()
    @Published var babyMilestones: [BabyMilestone] = []
    
    func getAllMilestone() {
        let milestones = BabyMilestone.getAllBabyMilestone()
        babyMilestones = milestones
    }
}
