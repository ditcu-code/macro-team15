//
//  MilestoneDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct MilestoneDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let notes = ["Abcalscjkdskvjdfknvdfjkvndfkjnv", "Def", "Ghi"]

    var body: some View {
        ZStack {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                MissionView()
                
                Divider()
                
                ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: AnyView(Text("Abc")))
            }
        }
        
        .navigationTitle(Text("Detail Misi"))
        .toolbar {
            ToolbarItem {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}

struct MilestoneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MilestoneDetailView()

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Back")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
