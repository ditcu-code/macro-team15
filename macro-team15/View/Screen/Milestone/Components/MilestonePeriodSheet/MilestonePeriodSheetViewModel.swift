//
//  MilestonePeriodSheetViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 01/12/22.
//

import Foundation

class MilestonePeriodSheetViewModel: ObservableObject {
    @Published var months: [Int] = []
    @Published var appData = AppData()
    
    init() {
        getMonths()
    }
    
    func getMonths() {
        let reqMonths = MilestoneData.getMonths()
        months = reqMonths
    }
}
