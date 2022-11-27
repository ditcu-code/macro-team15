//
//  MilestoneDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct MilestoneDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                MissionView(missionTitle: "Bisa menggerakkan kepala dari kiri/kanan ke tengah")

                Divider()

                ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: AnyView(Text("Abc")))

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .padding(.leading, 8)

                        ForEach(0 ..< 5) { item in
                            ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!", navigationLink: AnyView(Text("Detail")))
                        }
                    }
                }

                Divider()
                    .padding(.top)

                ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan Ceroy", navigationLink: nil)
                
                ScrollView {
                    NoteView(title: "Judul catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "", note: "")))
                }
            }
        }
        
        .navigationTitle(Text("Detail Misi"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.ui.primary)
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
