//
//  UserData.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//

import Foundation
import SwiftUI

final class AppData: ObservableObject {
    @AppStorage(AppStorageEnum.babyId.rawValue) var currentBabyId: String = ""
    @AppStorage(AppStorageEnum.babyName.rawValue) var currentBabyName: String = ""
    @AppStorage(AppStorageEnum.selectedMonth.rawValue) var selectedMonth: Int = 1
    @AppStorage(AppStorageEnum.babyAgeMonth.rawValue) var babyAgeMonth: Int = 0
    @AppStorage(AppStorageEnum.doneOnboarding.rawValue) var isDoneOnboarding: Bool = false
    @AppStorage(AppStorageEnum.userHasInstalled.rawValue) var userHasInstalled: Bool = false
    
    static func setBabyId(_ id: String) {
        UserDefaults.standard.set(id, forKey: AppStorageEnum.babyId.rawValue)
    }
    
    static func setBabyName(_ name: String) {
        UserDefaults.standard.set(name, forKey: AppStorageEnum.babyName.rawValue)
    }
    
    static func setSelectedMonth(_ month: Int) {
        UserDefaults.standard.set(month, forKey: AppStorageEnum.selectedMonth.rawValue)
    }
    
    static func setBabyAgeMonth(_ month: Int) {
        UserDefaults.standard.set(month, forKey: AppStorageEnum.babyAgeMonth.rawValue)
    }
    
    static func setIsDoneOnboarding(_ done: Bool) {
        UserDefaults.standard.set(done, forKey: AppStorageEnum.doneOnboarding.rawValue)
    }
    
    static func setUserHasInstalled(_ done: Bool) {
        UserDefaults.standard.set(done, forKey: AppStorageEnum.userHasInstalled.rawValue)
    }
    
}

enum AppStorageEnum: String {
    case babyId = "currentBabyId"
    case babyName = "currentBabyName"
    case selectedMonth = "selectedMonth"
    case babyAgeMonth = "babyAgeMonth"
    case doneOnboarding = "isDoneOnboarding"
    case userHasInstalled = "userHasInstalled"
}
