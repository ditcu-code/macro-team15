//
//  HighlightedStimulusView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct HighlightedStimulusView: View {
    
    let withCTA: Bool
    let stimulus: Stimulus
    let allStimulus: [Stimulus]
    
    var body: some View {
        VStack {
            Image.ui.tummyTime
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
                .padding(.vertical, 30)
            
            VStack {
                Text(stimulus.type.rawValue)
                    .font(.custom(FontType.regular.rawValue, size: 16))
                    .foregroundColor(Color.ui.text)
                
                Divider().padding(.horizontal, 60)
                
                Text(stimulus.activityName)
                    .font(.custom(FontType.semiBold.rawValue, size: 30))
                    .padding(.vertical, 3)
                    .foregroundColor(Color.ui.primary)
                    .multilineTextAlignment(.center)
                
                Text("Aktivitas ini dapat mendukung pencapaian \(StringManipulation.categoryStimulus(cat: stimulus.categories))")
                    .font(.custom(FontType.light.rawValue, size: 16))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .foregroundColor(Color.ui.text)
            }
            .padding(.horizontal)
            
            if withCTA {
                NavigationLink {
                    StimulusDetailView(stimulus: stimulus, allStimulus: allStimulus)
                } label: {
                    Text("Lakukan")
                }
                .buttonStyle(PrimaryButtonStyle(isShort: true))
                .padding(.horizontal)
                .padding(.top, 10)
            }
        }
    }
}

//
//struct HighlightedStimulusView_Previews: PreviewProvider {
//    static var previews: some View {
//        HighlightedStimulusView(withCTA: true)
//    }
//}
