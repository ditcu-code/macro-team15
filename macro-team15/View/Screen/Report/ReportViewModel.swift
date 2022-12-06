//
//  ReportViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 04/12/22.
//

import Foundation
import Combine
import CoreData

class ReportViewModel: ObservableObject {
    @Published var monthPeriodSheet = false
    @Published var monthVersusPeriodSheet = false
    
    @Published var month: Int = 0
    @Published var monthVersus: Int = 0
    
    @Published var motoricCount: Int = 0
    @Published var cognitiveCount: Int = 0
    @Published var socialCount: Int = 0
    @Published var languageCount: Int = 0
    
    @Published var motoricTotal: Int = 0
    @Published var cognitiveTotal: Int = 0
    @Published var socialTotal: Int = 0
    @Published var languageTotal: Int = 0
    
    @Published var motoricMonth: Int = 0
    @Published var cognitiveMonth: Int = 0
    @Published var socialMonth: Int = 0
    @Published var languageMonth: Int = 0
    
    @Published var motoricVersus: Int = 0
    @Published var cognitiveVersus: Int = 0
    @Published var socialVersus: Int = 0
    @Published var languageVersus: Int = 0
    
    @Published var appData = AppData()
    @Published var milestoneData: [Milestone] = MilestoneData.getAll()
    
    @Published var uncompletedMotoric: [BabyMilestone] = []
    @Published var uncompletedCognitive: [BabyMilestone] = []
    @Published var uncompletedSocial: [BabyMilestone] = []
    @Published var uncompletedLanguage: [BabyMilestone] = []
    
    @Published var currentBaby: Baby? = nil
    
    private var cancellable: AnyCancellable?
    
    init() {
        month = appData.selectedMonth
        getData()
        cancellable = NotificationCenter.default.publisher(for: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.getData()
            })
    }
    
    func getData() {
        getTotal()
        getCount()
        getUncompletedMilestone()
    }
    
    func getCountMonth() {
        motoricMonth = BabyMilestone.getCompletedMilestoneByCategory(with: .motoric, month: month)?.count ?? 0
        cognitiveMonth = BabyMilestone.getCompletedMilestoneByCategory(with: .cognitive, month: month)?.count  ?? 0
        socialMonth = BabyMilestone.getCompletedMilestoneByCategory(with: .social, month: month)?.count ?? 0
        languageMonth = BabyMilestone.getCompletedMilestoneByCategory(with: .language, month: month)?.count ?? 0
    }
    
    func getCountVersus() {
        motoricVersus = BabyMilestone.getCompletedMilestoneByCategory(with: .motoric, month: monthVersus)?.count ?? 0
        cognitiveVersus = BabyMilestone.getCompletedMilestoneByCategory(with: .cognitive, month: monthVersus)?.count  ?? 0
        socialVersus = BabyMilestone.getCompletedMilestoneByCategory(with: .social, month: monthVersus)?.count ?? 0
        languageVersus = BabyMilestone.getCompletedMilestoneByCategory(with: .language, month: monthVersus)?.count ?? 0
    }
    
    func getCount() {
        motoricCount = BabyMilestone.getCompletedMilestoneByCategory(with: .motoric)?.count ?? 0
        cognitiveCount = BabyMilestone.getCompletedMilestoneByCategory(with: .cognitive)?.count  ?? 0
        socialCount = BabyMilestone.getCompletedMilestoneByCategory(with: .social)?.count ?? 0
        languageCount = BabyMilestone.getCompletedMilestoneByCategory(with: .language)?.count ?? 0
    }
    
    func getTotal() {
        let milestones = MilestoneData.getAll()
        
        motoricTotal = milestones.filter { item in
            item.category == .motoric
        }.count
        
        cognitiveTotal = milestones.filter { item in
            item.category == .cognitive
        }.count
        
        socialTotal = milestones.filter { item in
            item.category == .social
        }.count
        
        languageTotal = milestones.filter { item in
            item.category == .language
        }.count
    }
    
    func getUncompletedMilestone() {
        uncompletedMotoric = BabyMilestone.getUncompletedMilestoneByCategory(with: .motoric, warningMonth: appData.babyAgeMonth)!
        uncompletedCognitive = BabyMilestone.getUncompletedMilestoneByCategory(with: .cognitive, warningMonth: appData.babyAgeMonth)!
        uncompletedSocial = BabyMilestone.getUncompletedMilestoneByCategory(with: .social, warningMonth: appData.babyAgeMonth)!
        uncompletedLanguage = BabyMilestone.getUncompletedMilestoneByCategory(with: .language, warningMonth: appData.babyAgeMonth)!
    }
    
    func getImportantNotes() -> [BabyMilestoneNote] {
        let milestones = BabyMilestoneNote.getNotesByImportant()

        return milestones ?? []
    }
}
