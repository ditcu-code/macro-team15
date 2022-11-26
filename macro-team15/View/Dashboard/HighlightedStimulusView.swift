//
//  HighlightedStimulusView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct HighlightedStimulusView: View {
    
    let withCTA: Bool
    
    var body: some View {
        VStack {
            Image("PlaceholderImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
            
            VStack {
                Text("Aktivitas")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color.ui.secondary)
                
                Divider()
                
                Text("Tummy Time")
                    .font(.largeTitle)
                    .padding(.vertical, 4)
                    .foregroundColor(Color.ui.primary)
                
                Text("Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!")
                    .multilineTextAlignment(.center)
            }
            .padding()
            .offset(CGSize(width: 0, height: -80))
            .padding(.bottom, -100)
            
            if withCTA {
                Button("Lakukan") {
                    
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding([.top, .horizontal])
            }
            
            Divider()
                .padding(.vertical)
        }
    }
}

struct HighlightedStimulusView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightedStimulusView(withCTA: true)
    }
}
