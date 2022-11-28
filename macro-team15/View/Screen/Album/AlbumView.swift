//
//  AlbumView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct AlbumScreen: View {
    
    let name: String
    var layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                BackgroundView()
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 46)
                            .foregroundColor(Color.ui.segmentedControlBackground)
                        
                        HStack {
                            CustomSegmentedControlView(selectedTab: $selectedTab)
                        }
                        .padding(.horizontal, 3)
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 20) {
                            ForEach(0..<2) { i in
                                MilestonePhotoCardView()
                                    .padding(.vertical)
                                    .padding(i % 2 == 0 ? .leading : .trailing)
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            
            .navigationTitle(Text("Album Ceroy!"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileAvatarView()
                }
            }
        }
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen(name: "Ceroy")
    }
}
