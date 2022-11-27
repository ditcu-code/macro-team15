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
        HStack {
            Text("\(order)")
                .foregroundColor(Color.ui.secondary)
                .fontWeight(.heavy)
                .padding(10)
                .background {
                    Circle()
                        .stroke(Color.ui.secondary, lineWidth: 3)
                }
            
            Text(description)
                .fontWeight(.medium)
                .foregroundColor(Color.ui.secondary)
                .padding(.leading, 4)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 8)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct StimulusStepView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusStepView(order: 1, description: "Lakukan Tummy Time di tempat yang datar seperti lantai, kasur, atau di atas perut dan pangkuan bunda")
    }
}
