//
//  MilestoneDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct MilestoneDetailView: View {
    
    var milestone: Milestone
    var cdMilestone: BabyMilestone
    var babyName = AppData().currentBabyName
    
    @State private var isChecked = false
    @State var refreshId: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    func filterStimulus() -> [Stimulus] {
        let stimuluses = StimulusData.getAll()
        var stimuls: [Stimulus] = []
        
        milestone.stimulusID?.forEach({ id in
            let onj = stimuluses.filter { stim in
                stim.id == id
            }.first
            if let any = onj {
                stimuls.append(any)
            }
        })
        
        return stimuls
    }
    
    var body: some View {
        let stimuluses = StimulusData.getAll()
        
        ScrollView {
            MissionView(missionTitle: milestone.title)
            
            Divider().padding([.horizontal, .bottom])
            
            ContentHeaderView(
                title: "Aktivitas",
                subtitle: "Dirancang untuk mendukung pencapaian \(babyName)",
                navigationLink: AnyView(StimuliView(allStimulus: filterStimulus())),
                hideButton: stimuluses.count > 5 ? true : false
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                        .padding(.leading, 8)
                    
                    
                    if let stimulus = filterStimulus() {
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
                        PersistenceController.shared.save()
                        
                        withAnimation {
                            refreshId += 1
                        }
                        
                        isChecked = cdMilestone.isChecked
                    }
            }
        }.id(refreshId)
        
        
            .sheet(isPresented: $isChecked) {
                ProgressShareView(title: milestone.title)
                    .presentationDetents([.height(600)])
            }
    }
}
