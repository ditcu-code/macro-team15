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
    
    @Published var babies: [Baby] = []
    
    @Published var step: Int = 0
    @Published var selectedPicture: PhotosPickerItem? = nil
    
    
    init() {
        getBabies()
    }
    
    func getBabies() {
        let req = Baby.getAll()
        babies = req
    }
    
    func prevStep() {
        step -= 1
    }
    
    func nextStep() {
        step += 1
    }
    
    func setAppDatas(_ uuid: UUID, _ name: String, _ selectedMonth: Int) {
        AppData.setBabyId(uuid.uuidString)
        AppData.setBabyName(name)
        AppData.setSelectedMonth(selectedMonth)
        AppData.setBabyAgeMonth(selectedMonth)
    }
    
    func saveBaby() {
        let context = PersistenceController.viewContext
        let baby = Baby(context: context)
        let defaultPhoto = UIImage(named: "DefaultProfilePicture")?.pngData()
        let newId = UUID()
        let selectedMonth = Calendar.current.dateComponents([.month], from: birthDate, to: Date()).month ?? 0
        
        baby.id = newId
        baby.name = name
        baby.birthDate = birthDate
        baby.photo = photo ?? defaultPhoto
        
        setAppDatas(newId, name, selectedMonth)
        
        if BabyMilestone.getAll().isEmpty {
            injectAllMilestone(baby: baby, selectedMonth: selectedMonth)
        }
        
        PersistenceController.shared.save()
    }
    
    func finalStep() {
        saveBaby()
        AppData.setIsDoneOnboarding(true)
    }
    
    func injectAllMilestone(baby: Baby?, selectedMonth: Int) {
        let allMilestones = MilestoneData.getAll()
        allMilestones.forEach { item in
            let context = PersistenceController.viewContext
            let babyMilestone = BabyMilestone(context: context)
            babyMilestone.baby = baby
            babyMilestone.id = UUID()
            babyMilestone.isChecked = false
            babyMilestone.category = item.category.rawValue
            babyMilestone.month = Int16(item.month)
            babyMilestone.warningMonth = Int16(item.warningMonth)
            babyMilestone.milestoneID = Int16(item.id)
        }
        PersistenceController.shared.save()
    }
    
}
