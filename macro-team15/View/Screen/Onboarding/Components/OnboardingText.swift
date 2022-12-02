//
//  OnboardingText.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct OnboardingText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom(FontType.regular.rawValue, size: 19))
            .foregroundColor(Color.ui.secondary)
            .padding(10)
    }
}

struct OnboardingText_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingText(text: "Hello World")
    }
}
