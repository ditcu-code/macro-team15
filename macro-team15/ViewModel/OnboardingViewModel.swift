//
//  OnboardingViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var dob: Date = Date()
    @Published var photo: Data = Data()
    @Published var babyList: [Baby] = []
    
    private let context = PersistenceController().container.viewContext
    
    init () {
        
    }
    
    static func generateNewBaby(_ name: String, _ dob: Date, _ photo: Data?) -> Baby {
        let context = PersistenceController.viewContext
        let baby = Baby(context: context)
        
        baby.name = name
        baby.dob = dob
        baby.photo = photo
        
        return baby
    }
    
}
