//
//  StimulusDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusDetailView: View {
    var body: some View {
        ScrollView {
            HighlightedStimulusView(withCTA: false)
        }
        
        .navigationTitle(Text("Detail Aktivitas"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.ui.primary)
                }
            }
        }
    }
}

struct StimulusDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StimulusDetailView()
        }
    }
}
