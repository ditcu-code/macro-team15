//
//  Color.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 04/11/22.
//

import SwiftUI

extension Color {
    
    static let ui = Color.UI()
    
    struct UI {
        let background = Color("BackgroundColor")
        
        let primary = Color("PrimaryColor")
        
        let disabledText = Color("TextDisabledColor")
        let text = Color("TextColor")
        
        let cognitivePrimary = Color("CognitivePrimaryColor")
        let cognitiveSecondary = Color("CognitiveSecondaryColor")
        
        let languagePrimary = Color("LanguagePrimaryColor")
        let languageSecondary = Color("LanguageSecondaryColor")
        
        let motorPrimary = Color("MotorPrimaryColor")
        let motorSecondary = Color("MotorSecondaryColor")
        
        let socialPrimary = Color("SocialPrimaryColor")
        let socialSecondary = Color("SocialSecondaryColor")
    }
    
}
