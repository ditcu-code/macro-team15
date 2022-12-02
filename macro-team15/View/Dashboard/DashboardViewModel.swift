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
    @Published var stimuluses: [Stimulus] = []
//    @Published var babyMilestones: [BabyMilestone] = []
    @Published var appData = AppData()
    @Published var milestoneData: [Milestone] = MilestoneData.getAll()
    @Published var stimulusData: [Stimulus] = StimulusData.getAll()
    
    init () {
        getData()
    }
    
    func getStimulus() -> [Stimulus] {
        var stimulus: [Stimulus] = []
        let listStimulusId = milestoneData
            .filter{$0.month == appData.selectedMonth}
            .compactMap({$0.stimulusID})
            .flatMap{$0}
            .uniqued()
        
        let allStimulus = StimulusData.getAll()

        listStimulusId.forEach { item in
            stimulus.append(allStimulus.filter{$0.id == item}.first!)
        }
        
        return stimulus
    }
    
    func getData() {
        setCurrentBabyId()
        getBabies()
//        getBabyMilestones()
    }
    
    func setCurrentBabyId() {
        let baby = Baby.getSpecificBaby(with: UUID(uuidString: appData.currentBabyId))
        currentBaby = baby
    }
    
    func getBabies() {
        let req = Baby.getAll()
        babies = req
    }
    
//    func getBabyMilestones() {
//        let req = BabyMilestone.getAll()
//        babyMilestones = req
//    }
}
