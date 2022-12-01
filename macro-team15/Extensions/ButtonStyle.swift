//
//  Button.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 24/11/22.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 60)
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

struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .foregroundColor(Color.ui.secondary)
            .frame(minHeight: 60)
            .padding(.horizontal)
            .background(
                Capsule()
                    .foregroundColor(Color.ui.primary.opacity(0.2))
                    .shadow(
                        color: .gray.opacity(0.5),
                        radius: 2, x: 0, y: 1
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
    }
}

struct SmallGreenButtonStyle: ButtonStyle {
    var transparent: Bool = false
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.subheadline.bold())
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .frame(minWidth: 125)
            .background(Color.ui.primary.opacity(transparent ? 0.3 : 1))
            .cornerRadius(16)
            .shadow(
                color: .gray.opacity(0.5),
                radius: 2, x: 0, y: 1
            )
    }
}
