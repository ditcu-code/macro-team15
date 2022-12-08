//
//  CategoryCustomization.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 07/12/22.
//

import Foundation
import SwiftUI

class CategoryCustomization {
    static func colorSwitcher(_ category: MilestoneCategory) -> Color {
        switch category {
        case .cognitive:
            return Color.ui.cognitivePrimary
        case .motoric:
            return Color.ui.motorPrimary
        case .social:
            return Color.ui.socialPrimary
        case .language:
            return Color.ui.languagePrimary
        }
    }
    
    static func iconSwitcher(_ category: MilestoneCategory) -> String {
        switch category {
        case .cognitive:
            return "puzzlepiece.fill"
        case .motoric:
            return "gearshape.fill"
        case .social:
            return "heart.fill"
        case .language:
            return "character.bubble.fill"
            
        }
    }
}
