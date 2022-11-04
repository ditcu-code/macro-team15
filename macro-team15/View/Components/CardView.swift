//
//  CardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 03/11/22.
//

import SwiftUI

struct CardView: View {
    
    let text = "Bisa memungut benda sebesar kacang dengan cara meraup"
    let backgroundColors: [Color]
    let verticalCapsuleColor: Color
    let isChecked: Bool
    
    var body: some View {
        HStack {
            CardVerticalCapsuleView(color: verticalCapsuleColor)
            
            CardContentView(text: text)
            
            CardCheckboxView(isChecked: isChecked)
        }
        .frame(maxWidth: .infinity)
        .background {
            LinearGradient(colors: backgroundColors,
                           startPoint: .leading,
                           endPoint: .trailing)
        }
        .cornerRadius(24)
        .padding()
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            backgroundColors: [Color(hex: "#ADE9FA"), Color(hex: "#E26F2A")],
            verticalCapsuleColor: Color.blue,
            isChecked: false
        )
    }
}

struct CardVerticalCapsuleView: View {
    
    let color: Color
    
    var body: some View {
        Capsule()
            .frame(width: 10, height: 25)
            .foregroundColor(color)
            .padding(.leading)
    }
    
}

struct CardCheckboxView: View {
    
    let isChecked: Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
            .resizable()
            .frame(width: 25, height: 25)
            .padding(.trailing)
    }
    
}

struct CardContentView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .padding()
    }
    
}
