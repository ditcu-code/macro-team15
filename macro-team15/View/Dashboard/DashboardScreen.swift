//
//  Dashboard.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct DashboardScreen: View {
    @State private var selectedMonth: Int = 1
    @State private var milestonePeriod: Bool = false
    @State private var profileSwitcher: Bool = false
    @State private var refreshId: Int = 1
    
    @ObservedObject var vm = DashboardViewModel()
    @ObservedObject var appData = AppData()
    
    var body: some View {
        let babyName = vm.babies.first?.name ?? "Aruna"
        
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    if let stimulus = vm.getStimulus().first {
                        HighlightedStimulusView(withCTA: true, stimulus: stimulus, allStimulus: vm.getStimulus())
                    }
                    
                    Divider().padding(.vertical)
                    
                    ContentHeaderView(
                        title: "Aktivitas",
                        subtitle: "Dirancang untuk mendukung pencapaian \(babyName)",
                        navigationLink: AnyView(StimuliView())
                    )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Spacer()
                                .padding(.leading, 8)
                            
                            ForEach(vm.getStimulus().dropFirst().prefix(5)) { item in
                                ActivityCardViewV2(stimulus: item, allStimulus: vm.getStimulus())
                            }
                        }
                    }
                    
                    Divider()
                        .padding()
                    
                    VStack {
                        
                        ContentHeaderView(title: "Milestone", subtitle: "Perkembangan \(babyName) di bulan ini", navigationLink: nil)
                            .padding(.top)
                        
                        ProgressBar(currentProgress: CGFloat(Double(vm.totalCompletedMilestone)/Double(vm.totalMilestone)))
                            .animation(.spring(), value: vm.totalCompletedMilestone)
                        
                        Text("\(vm.totalCompletedMilestone) dari \(vm.totalMilestone) perkembangan tercapai")
                            .font(.subheadline)
                            .foregroundColor(Color.ui.secondary)
                            .padding(.vertical)
                        
                        ForEach(MilestoneCategory.allCases, id: \.self) { category in
                            
                            Divider()
                            
                            let listMilestone = vm.milestoneData.filter{$0.category == category && $0.month == appData.selectedMonth}
                            
                            MilestoneCategoryCardDashboardView(category: category, milestone: listMilestone).id(refreshId)
                            
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                    .onAppear{
                        withAnimation(.spring()) {
                            refreshId += 1
                        }
                    }
                    
                    
                    Divider()
                        .padding()
                    
                    
                    
                    ContentHeaderView(
                        title: "Catatan",
                        subtitle: "Hal-hal penting mengenai perkembangan \(babyName)",
                        navigationLink: AnyView(NotesView()),
                        hideButton: vm.allNotes.count < 5 ? true : false
                    )
                    
                    if vm.allNotes.isEmpty {
                        EmptyView(note: "Belum ada catatan").padding(.bottom, 30)
                    } else {
                        ForEach(vm.allNotes.prefix(5)) { note in
                            NoteViewV2(milestone: MilestoneData.getAll().filter({ $0.id == note.milestone?.milestoneID ?? 1 }).first!, babyMilestone: note.milestone!, babyNotes: note)
                                .padding(.bottom)
                        }
                    }
//                    NotifTester()
                }
                
                .background(alignment: .center) {
                    BackgroundView()
                        .edgesIgnoringSafeArea(.all)
                }
                
                .navigationTitle("\(geo.frame(in: .global).minY < 100 ? "Progres" : "Hi, \(babyName)!")")
                
                .toolbar {
                    // Milestone dropdown
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            milestonePeriod.toggle()
                        } label: {
                            Text("Bulan ke-\(appData.selectedMonth)")
                            
                            Image(systemName: "chevron.down")
                                .bold()
                                .padding(.leading, -4)
                        }
                        .font(.headline)
                        .foregroundColor(Color.ui.primary)
                    }
                    
                    // Profile image
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            profileSwitcher.toggle()
                        } label: {
                            ProfileAvatarViewV2(photo: vm.babies.first?.photo!)
                        }
                    }
                }
                
                .sheet(isPresented: $profileSwitcher) {
                    ProfileEditView(baby: vm.currentBaby!)
                }
                
                .sheet(isPresented: $milestonePeriod) {
                    MilestonePeriodSheet()
                }
                
            }
        }
        .onChange(of: vm.appData.selectedMonth) { newValue in
            vm.countCompletedMilestone()
            vm.countTotalMilestone()
        }
        .onAppear {
            NotificationManager.instance.requestAuthorization()
            vm.removeNotif()
            vm.setupNotif()
        }
//        .onDisappear{
//            vm.setupNotif()
//        }
    }
}

