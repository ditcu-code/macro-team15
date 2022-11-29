//
//  OnboardingViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 27/11/22.
//

import Foundation
import Combine
import CoreData

class ContentViewModel: ObservableObject {
    @Published var babies: [Baby] = []
    
    private var cancellable: AnyCancellable?
    
    init () {
        getBaby()
        cancellable = NotificationCenter.default.publisher(for: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { _ in
                self.getBaby()
            })
    }
    
    func getBaby() {
        let req = Baby.getAllBaby()
        babies = req
    }
}
