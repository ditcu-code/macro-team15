//
//  Enum.swift
//
//  Created by Aditya Cahyo on 31/10/22.
//

import Foundation

// ContentView
enum Tabs: String, CaseIterable, Identifiable {
    case home, milestone, report
    var id: Self { self }
}
//
//static func generateNew(_ name: String, _ dob: Date, _ photo: Data?) -> Baby {
//    let context = PersistenceController.viewContext
//    let baby = Baby(context: context)
//    
//    baby.name = name
//    baby.birthDate = dob
//    baby.photo = photo
//    
//    return baby
//}
//
//static func getAllBaby() -> [Baby] {
//    let context = PersistenceController.viewContext
//    let request = Baby.fetchRequest()
//    request.shouldRefreshRefetchedObjects = true
//    
//    do {
//        let babies = try context.fetch(request)
//        if babies.isEmpty {
//            return []
//        }
//        return babies
//    } catch {
//        print(error.localizedDescription)
//    }
//    
//    return []
//}
