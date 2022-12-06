//
//  StimulusStepView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusStepView: View {
    
    let order: Int
    let description: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text("\(order)")
                .font(.custom(FontType.semiBold.rawValue, size: 18))
                .foregroundColor(Color.ui.secondary)
                .padding(10)
                .background {
                    Circle()
                        .stroke(Color.ui.secondary, lineWidth: 3)
                }
            
            Text(description)
                .font(.custom(FontType.regular.rawValue, size: 14))
                .foregroundColor(Color.ui.secondary)

            Spacer(minLength: 1)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

struct StimulusStepView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusStepView(order: 1, description: "Lakukan Tummy Time di tempat yang datar seperti lantai, kasur, atau di atas perut dan pangkuan bunda")
    }
}
