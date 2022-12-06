//
//  StimulusDetailViewModel.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 02/12/22.
//

import Foundation

class StimulusDetailViewModel: ObservableObject {
    @Published var materials: [ActivityMaterial] = []
    @Published var stimuluses: [Stimulus] = []
    
    init() {
        
    }
    
    func getMaterial(stimulus: Stimulus) {
        let reqMaterials = MaterialData.getAll()
        var materials: [ActivityMaterial] = []
        
        stimulus.materials?.forEach({ id in
            materials.append(
                reqMaterials.filter { material in
                    material.id == id
                }.first!
            )
        })
        
        self.materials = materials
    }
    
}
