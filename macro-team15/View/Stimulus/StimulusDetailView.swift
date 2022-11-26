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
            
            Divider()
                .padding(.top)
                .padding(.bottom, 8)
            
            ContentHeaderView(title: "Material", subtitle: "Peralatan untuk melakukan aktivitas ini", navigationLink: nil)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                        .padding(.leading, 10)
                    
                    ForEach(0 ..< 5) { item in
                        StimulusMaterialView()
                            .padding(.trailing, 10)
                    }
                }
            }
            .padding(.top)
            
            Divider()
                .padding(.vertical)
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
