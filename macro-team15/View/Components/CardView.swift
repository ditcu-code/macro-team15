//
//  CardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 03/11/22.
//

import SwiftUI

struct CardView: View {
    
    let text: String
    let primaryColor: Color
    let secondaryColor: Color
    let isChecked: Bool
    let colorScheme: ColorScheme
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack {
                CardVerticalCapsuleView(color: primaryColor)
                    .frame(width: 20)
                
                CardContentView(text: text, colorScheme: colorScheme)
                
                CardCheckboxView(isChecked: isChecked)
                    .frame(width: 30)
            }
            .padding()
            
            Image(systemName: "star.fill")
                .foregroundColor(secondaryColor)
                .shadow(radius: 10)
                .offset(CGSize(width: -35, height: -26))
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(secondaryColor)
                .shadow(radius: 10)
                .offset(CGSize(width: 5, height: 28))
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(secondaryColor)
                .shadow(radius: 10)
                .offset(CGSize(width: -75, height: 26))
            
        }
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(colors: [secondaryColor, primaryColor],
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .cornerRadius(24)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            text: "Bisa mengangkat kepala mandiri hingga setinggi 45 derajat",
            primaryColor: Color.ui.socialPrimary,
            secondaryColor: Color.ui.socialSecondary,
            isChecked: false,
            colorScheme: .light
        )
    }
}

struct CardVerticalCapsuleView: View {
    
    let color: Color
    
    var body: some View {
        Capsule()
            .frame(width: 10, height: 35)
            .foregroundColor(color)
    }
    
}

struct CardCheckboxView: View {
    
    let isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
    }
    
}

struct CardContentView: View {
    
    let text: String
    let colorScheme: ColorScheme
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .font(.headline)
            .foregroundColor(Color.ui.text)
            .colorScheme(colorScheme)
    }
    
}
