//
//  HighlightedStimulusView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct HighlightedStimulusView: View {
    var body: some View {
        VStack {
            Image("PlaceholderImage")
                .resizable()
            
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
            
            Button {
                
            } label: {
                Text("Lakukan")
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.ui.primary)
                    )
                    .padding()
            }
            
            Divider()
        }
    }
}

struct HighlightedStimulusView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightedStimulusView()
    }
}