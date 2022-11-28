//
//  AlbumView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct AlbumScreen: View {
    
    let name: String
    
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
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        
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

struct CustomSegmentedControlView: View {
    
    let selections = ["Milestone", "Aktivitas"]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ForEach(selections.indices, id: \.self) { index in
            Text(selections[index])
                .frame(maxWidth: .infinity)
                .bold()
                .foregroundColor(index == selectedTab ? .white : Color.ui.text)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(index == selectedTab ? Color.ui.primary : Color.ui.segmentedControlBackground)
                }
                .onTapGesture {
                    withAnimation(Animation.interactiveSpring(response: 0.2, dampingFraction: 2, blendDuration: 0.5)) {
                        selectedTab = index
                    }
                }
        }
    }
    
}
