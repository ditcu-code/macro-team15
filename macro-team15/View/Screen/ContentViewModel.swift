//
//  OnboardingViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 27/11/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    
    init () {
        getBaby()
    }
    
    func getBaby() {
        let context = PersistenceController.shared.container.viewContext
        let req = Baby.fetchRequest()
        req.shouldRefreshRefetchedObjects = true
        
        do {
            let reqBabies = try context.fetch(req)
            babies = reqBabies
        } catch {
            print(error.localizedDescription)
        }
        
        print(babies)
    }
}
