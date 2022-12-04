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
                    
                    ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian \(babyName)", navigationLink: AnyView(Text("Detail")))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Spacer()
                                .padding(.leading, 8)
                            
                            ForEach(vm.getStimulus().dropFirst()) { item in
                                ActivityCardViewV2(stimulus: item, allStimulus: vm.getStimulus())
                            }
                        }
                    }
                    
                    ContentHeaderView(title: "Milestone", subtitle: "Perkembangan \(babyName) di bulan ini", navigationLink: nil)
                        .padding(.top)
                    
                    VStack {
                        ForEach(MilestoneCategory.allCases, id: \.self) { category in
                            let listMilestone = vm.milestoneData.filter{$0.category == category && $0.month == appData.selectedMonth}
                            
                            MilestoneCategoryCardDashboardView(category: category, milestone: listMilestone).id(refreshId)
                            if category != MilestoneCategory.allCases.last {
                                Divider()
                            }
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                    .onAppear{
                        refreshId += 1
                    }
                    
                    ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan \(babyName)", navigationLink: AnyView(Text("Detail")))
                        .padding(.top)
                    
                    Text("Tidak ada catatan penting")
                        .padding(.vertical, 80)
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
                    ProfileSwitcherSheet()
                }
                
                .sheet(isPresented: $milestonePeriod) {
                    MilestonePeriodSheet()
                }
                
            }
        }
        
    }
}
