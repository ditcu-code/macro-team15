//
//  MilestoneDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct MilestoneDetailView: View {
    
    let milestone: Milestone
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
                    //                    NoteView(title: "Judul catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "", note: "")))
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
//
//struct MilestoneDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MilestoneDetailView(milestone: MilestoneData.getAll()[1])
//
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Text("Back")
//                            .foregroundColor(.blue)
//                    }
//                }
//        }
//    }
//}

struct MilestoneDetailViewV2: View {
    
    var milestone: Milestone
    var cdMilestone: BabyMilestone
    @State var refreshId: Int = 0
    @Environment(\.presentationMode) var presentationMode
    var babyName = AppData().currentBabyName
    
    var body: some View {
        ScrollView {
            MissionView(missionTitle: milestone.title)
            
            Divider().padding([.horizontal, .bottom])
            
            ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian \(babyName)", navigationLink: AnyView(Text("Abc")))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                        .padding(.leading, 8)
                    
                    if let stimulus = StimulusData.getAll().filter({$0.id == milestone.id}) {
                        ForEach(stimulus) { item in
                            ActivityCardViewV2(
                                stimulus: item,
                                allStimulus: StimulusData.getAll().filter({$0 != item})
                            )
                        }
                        if stimulus.isEmpty {
                            EmptyView(note: "Belum ada aktivitas yang dirancang untuk milestone ini")
                        }
                    }
                    
                }
            }
            
            Divider()
                .padding(.top)
            
            ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan \(babyName)", navigationLink: nil)
            
            ScrollView {
                
                NavigationLink {
                    NoteDetailViewV2(milestone: milestone, babyMilestone: cdMilestone)
                } label: {
                    Label("Tambah Catatan", systemImage: "plus.circle").labelStyle(.titleAndIcon)
                }
                .buttonStyle(PrimaryButtonStyle(isShort: true))
                .padding(.horizontal)
                .padding(.bottom, 5)
                
                let listNotes = cdMilestone.notes
                
                if let list = listNotes?.allObjects as? [BabyMilestoneNote] {
                    ForEach(list) { item in
                        NoteViewV2(milestone: milestone, babyMilestone: cdMilestone, babyNotes: item)
                    }
                }

            }
        }
        .background {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
        }
        
        .navigationTitle(Text("Detail Milestone"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Image(systemName: cdMilestone.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor(Color.ui.primary)
                    .onTapGesture {
                        cdMilestone.isChecked.toggle()
                        refreshId += 1
                        PersistenceController.shared.save()
                    }
            }
        }.id(refreshId)
    }
}
