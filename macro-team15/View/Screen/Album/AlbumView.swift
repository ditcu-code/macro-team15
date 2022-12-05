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
    @State var selectedPhoto = false
    
    var body: some View {
        NavigationView {
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
                        if selectedTab == 0 {
                            ForEach(0..<2) { i in
                                Button {
                                    selectedPhoto.toggle()
                                } label: {
                                    MilestonePhotoCardView()
                                        .padding(.vertical)
                                        .padding(i % 2 == 0 ? .leading : .trailing)
                                }
                            }
                        } else {
                            ForEach(0..<2) { i in
                                Button {
                                    selectedPhoto.toggle()
                                } label: {
                                    StimulusPhotoCardView()
                                        .padding(.vertical)
                                        .padding(i % 2 == 0 ? .leading : .trailing)
                                }
                            }
                        }
                    }
                    .animation(Animation.spring(), value: 2)
                }
            }
            .background {
                BackgroundView()
            }
            
            .navigationTitle(Text("Album Ceroy!"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileAvatarView()
                }
            }
            .sheet(isPresented: $selectedPhoto, content: {
                ProgressShareView(isPresented: $selectedPhoto)
            })
        }
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen(name: "Ceroy")
    }
}
