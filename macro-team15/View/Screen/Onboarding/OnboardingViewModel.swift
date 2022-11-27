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
        let context = PersistenceController.shared.container.viewContext
        let baby = Baby(context: context)
        let defaultPhoto = UIImage(named: "DefaultProfilePicture")?.pngData()

        baby.name = name
        baby.birthDate = birthDate
        baby.photo = defaultPhoto ?? photo
//
        PersistenceController.shared.save()
    }
    
}
