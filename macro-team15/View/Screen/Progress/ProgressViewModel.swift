//
//  DashboardViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import Foundation
import CoreData
import Combine

class ProgressViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    @Published var currentBaby: Baby? = nil
    @Published var totalMilestone: Int = 0
    @Published var totalCompletedMilestone: Int = 0
    @Published var stimuluses: [Stimulus] = []
    
    @Published var appData = AppData()
    @Published var milestoneData: [Milestone] = MilestoneData.getAll()
    @Published var stimulusData: [Stimulus] = StimulusData.getAll()
    
    @Published var allNotes: [BabyMilestoneNote] = []
    
    var notif = NotificationManager.instance
    private var cancellable: AnyCancellable?
    
    init () {
        getData()
        cancellable = NotificationCenter.default.publisher(for: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.getData()
            })
    }
    
    func getData() {
        setCurrentBaby()
        getBabies()
        countTotalMilestone()
        countCompletedMilestone()
        getNotes()
    }
    
    func countTotalMilestone() {
        totalMilestone = milestoneData.filter { item in
            item.month == appData.selectedMonth
        }.count
    }
    
    func countCompletedMilestone() {
        let count = BabyMilestone.getCompletedMilestoneByMonth(with: Int16(appData.selectedMonth))?.count
        totalCompletedMilestone = count ?? 0
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
    
    func setCurrentBaby() {
        let baby = Baby.getSpecificBaby(with: UUID(uuidString: appData.currentBabyId))
        currentBaby = baby
    }
    
    func getBabies() {
        let req = Baby.getAll()
        babies = req
    }
    
    func getNotes() {
        let milestones = BabyMilestone.getNotesByMilestonePeriod(month: Int16(appData.selectedMonth))
        var notes = [BabyMilestoneNote]()
        milestones?.forEach { milestone in
            milestone.notes?.forEach({ note in
                notes.append(note as! BabyMilestoneNote)
            })
        }
        allNotes = notes
    }
    
    // MARK: Notification
    func setupNotif() {
        if let birthDate = currentBaby?.birthDate {
            notif.setBirthdayNotif(birthDate: birthDate)
        }
        notif.setWeeklyNotif()
    }
    
    func removeNotif() {
        notif.removeNotifications()
    }
}
