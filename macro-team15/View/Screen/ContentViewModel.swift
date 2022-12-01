//
//  OnboardingViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 27/11/22.
//

import Foundation
import Combine
import CoreData

class ContentViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    @Published var currentBaby: Baby? = nil
    @Published var appData = AppData()
    
    private var cancellable: AnyCancellable?
    
    init () {
        getBabies()
        cancellable = NotificationCenter.default.publisher(for: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.getBabies()
            })
        setCurrentBaby()
    }
    
    func getBabies() {
        let req = Baby.getAllBaby()
        babies = req
    }
    
    func setCurrentBaby() {
        if let id = babies.first?.id {
            let baby = Baby.getSpecificBaby(with: id)
            currentBaby = baby
            do {
                if BabyMilestone.getAllBabyMilestone().isEmpty {
                    injectAllMilestone(baby: baby)
                }
            }

        }
    }
    
    func injectAllMilestone(baby: Baby?) {
        let allMilestones = MilestoneData.getAll()
        allMilestones.forEach { item in
            let context = PersistenceController.viewContext
            let babyMilestone = BabyMilestone(context: context)
            babyMilestone.baby = baby
            babyMilestone.id = UUID()
            babyMilestone.isChecked = false
            babyMilestone.milestoneID = Int16(item.id)
        }
        PersistenceController.shared.save()
    }
    
    //    func getAllMilestone() {
    //        let assd = BabyMilestone.getAllBabyMilestone()
    //
    //        print(assd.first?.milestoneID)
    //    }
    //
    
}
