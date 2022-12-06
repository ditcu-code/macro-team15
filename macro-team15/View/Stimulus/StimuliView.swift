//
//  StimuliView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct StimuliView: View {
    var allStimulus: [Stimulus] = StimulusData.getAll()
    
    var body: some View {
        ScrollView {
            Spacer().padding(.top)

            ForEach(allStimulus) { item in
                ActivityCardLongView(stimulus: item, allStimulus: allStimulus)
                    .padding(.bottom, 10)
            }
        }
        .background(BackgroundView())
        .navigationTitle(Text("Stimulus"))
    }
}

struct StimuliView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StimuliView(allStimulus: StimulusData.getAll())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
