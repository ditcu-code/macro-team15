//
//  StimulusCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct ActivityCardLongView: View {
    var stimulus: Stimulus
    var allStimulus: [Stimulus]
    
    var body: some View {
        NavigationLink {
            StimulusDetailView(stimulus: stimulus, allStimulus: allStimulus)
        } label: {
            HStack(spacing: 28) {
                Image.ui.milestoneIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 343/4, height: 427/4)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(stimulus.activityName)
                        .font(.custom(FontType.semiBold.rawValue, size: 16))
                        .foregroundColor(Color.ui.secondary)
                    
                    Text("Aktivitas ini dapat mendukung pencapaian \(StringManipulation.categoryStimulus(cat: stimulus.categories))")
                        .font(.custom(FontType.light.rawValue, size: 12))
                        .foregroundColor(Color.ui.text)
                }
                .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 28)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.1), radius: 6)
            }
        }
        .padding(.horizontal)
    }
    
}

