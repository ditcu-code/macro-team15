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
    
    @ObservedObject var vm = DashboardViewModel()
    @ObservedObject var appData = AppData()
    
    var body: some View {
        let babyName = viewModel.babies.first?.name ?? "Aruna"
        
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    if let stimulus = vm.getStimulus().first {
                        HighlightedStimulusViewV2(withCTA: true, stimulus: stimulus)
                    }

                    Divider().padding(.vertical)
                    
                    ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian \(babyName)", navigationLink: AnyView(Text("Detail")))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Spacer()
                                .padding(.leading, 8)
                            
                            ForEach(vm.getStimulus().dropFirst()) { item in
                                ActivityCardViewV2(stimulus: item, navigationLink: AnyView(Text("Detail")))
                            }
                        }
                    }
                    
                    ContentHeaderView(title: "Milestone", subtitle: "Perkembangan \(babyName) di bulan ini", navigationLink: nil)
                        .padding(.top)
                    
                    VStack {
                        ForEach(MilestoneCategory.allCases, id: \.self) { category in
                            let listMilestone = vm.milestoneData.filter{$0.category == category && $0.month == appData.selectedMonth}
                            
                            MilestoneCategoryCardViewV2(category: category, milestone: listMilestone, navigationLink: AnyView(MilestoneDetailView()))
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
                    
                    ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan \(babyName)", navigationLink: AnyView(Text("Detail")))
                        .padding(.top)
                    
                    Text("Tidak ada catatan penting")
                        .padding(.vertical, 80)
                }
                
                .background(alignment: .center) {
                    BackgroundView()
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        HighlightedStimulusView(withCTA: true)
                        
                        Divider()
                            .padding()
                        
                        ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian \(babyName)", navigationLink: AnyView(Text("Detail")))
                        
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
                            .padding()
                        
                        ContentHeaderView(title: "Milestone", subtitle: "Perkembangan \(babyName) di bulan ini", navigationLink: nil)
                        
                        VStack {
                            ForEach(MilestoneCategory.allCases, id: \.self) { category in
                                let list = milestoneData.filter { item in
                                    item.category == category &&
                                    item.month == selectedMonth
                                }
                                
                                MilestoneCategoryCardViewV2(category: category, milestone: list, navigationLink: AnyView(MilestoneDetailView()))
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
                        
                        Divider()
                            .padding()
                        
                        ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan \(babyName)", navigationLink: AnyView(Text("Detail")))
                        
                        Text("Tidak ada catatan penting")
                            .padding(.vertical, 80)
                    }
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
                            ProfileAvatarViewV2(photo: viewModel.babies.first?.photo!)
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
