//
//  DashboardViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import Foundation
import CoreData

class DashboardViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    @Published var currentBaby: Baby? = nil
//    @Published var babyMilestones: [BabyMilestone] = []
//    @Published var appData = AppData()
    
    init () {
        getData()
    }
    
    func getData() {
//        setCurrentBabyId()
        getBabies()
//        getBabyMilestones()
    }
//
//    func setCurrentBabyId() {
//        let baby = Baby.getSpecificBaby(with: UUID(uuidString: appData.currentBabyId))
//        currentBaby = baby
//    }
    
    func getBabies() {
        let req = Baby.getAll()
        babies = req
    }
    
//    func getBabyMilestones() {
//        let req = BabyMilestone.getAll()
//        babyMilestones = req
//    }
}
