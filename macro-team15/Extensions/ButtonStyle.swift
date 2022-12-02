//
//  Button.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 24/11/22.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    var isShort: Bool? = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let short = isShort ?? false
        configuration.label
            .font(.custom(FontType.regular.rawValue, size: 16))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: short ? 48 : 60)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(isEnabled ? Color.ui.primary : Color.ui.primary.opacity(0.2))
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .shadow(
                color: .gray.opacity(isEnabled ? 0.5 : 0),
                radius: 2, x: 0, y: 1
            )
    }
}
