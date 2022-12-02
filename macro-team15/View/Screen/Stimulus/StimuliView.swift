//
//  StimuliView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct StimuliView: View {
    var body: some View {
        ScrollView {
            Spacer()
                .padding(.top)

            ForEach(0 ..< 8) { item in
                ActivityCardLongView(navigationLink: AnyView(StimulusDetailView()))
                    .padding(.bottom)
            }
        }
        .background(BackgroundView())

        .navigationTitle(Text("Stimulus"))
    }
}

struct StimuliView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StimuliView()
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
