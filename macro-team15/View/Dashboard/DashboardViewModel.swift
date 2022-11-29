//
//  DashboardViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    
    init () {
        getBaby()
    }
    
    func getBaby() {
        let req = Baby.getAllBaby()
        babies = req
    }
}
