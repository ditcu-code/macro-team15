//
//  OnboardingViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import Foundation
import SwiftUI
import PhotosUI
import CoreData

class OnboardingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var birthDate: Date = Date()
    @Published var photo: Data? = nil
    
    @Published var step: Int = 0
    @Published var selectedPicture: PhotosPickerItem? = nil
    
    func prevStep() {
        step -= 1
    }
    
    func nextStep() {
        step += 1
    }
    
    func saveBaby() {
        let context = PersistenceController.viewContext
        let baby = Baby(context: context)
        let defaultPhoto = UIImage(named: "DefaultProfilePicture")?.pngData()
        let newId = UUID()
        
        baby.id = newId
        baby.name = name
        baby.birthDate = birthDate
        baby.photo = photo ?? defaultPhoto
        
        UserDefaults.standard.set(
            newId.uuidString,
            forKey: "currentBabyId"
        )
        
        UserDefaults.standard.set(
            name,
            forKey: "currentBabyName"
        )
        
        UserDefaults.standard.set(
            Calendar.current.dateComponents([.month], from: birthDate, to: Date()).month,
            forKey: "selectedMonth"
        )
        
        if BabyMilestone.getAll().isEmpty {
            injectAllMilestone(baby: baby)
        }
        
        PersistenceController.shared.save()
    }
    
    func finalStep() {
        saveBaby()
        UserDefaults.standard.set(true, forKey: "isDoneOnboarding")
    }
    
    func injectAllMilestone(baby: Baby?) {
        let allMilestones = MilestoneData.getAll()
        allMilestones.forEach { item in
            let context = PersistenceController.viewContext
            let babyMilestone = BabyMilestone(context: context)
            babyMilestone.baby = baby
            babyMilestone.id = UUID()
            babyMilestone.isChecked = true
            babyMilestone.category = item.category.rawValue
            babyMilestone.month = Int16(item.month)
            babyMilestone.milestoneID = Int16(item.id)
        }
        PersistenceController.shared.save()
    }
    
}
