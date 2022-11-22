//
//  Dashboard.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct DashboardScreen: View {
    
    let name: String
    
    @State private var selectedMilestoneCategory = 1
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    DashboardHeaderView(name: name)

                    HighlightedStimulusView()

                    ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: AnyView(Text("Detail")))

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Spacer()
                                .padding(.leading, 8)

                            ForEach(0 ..< 5) { item in
                                ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!", navigationLink: AnyView(Text("Detail")))
                            }
                        }
                    }

                    ContentHeaderView(title: "Milestone", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: nil)
                        .padding(.top)
                    
                    VStack {
                        // Motor
                        MilestoneCategoryCardView(categoryTitle: "Motorik", missionTitle: "Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, navigationLink: AnyView(Text("Detail")))
                        
                        Divider()
                        
                        // Cognitive
                        MilestoneCategoryCardView(categoryTitle: "Kognitif", missionTitle: "Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap", primaryColor: Color.ui.cognitivePrimary, secondaryColor: Color.ui.cognitiveSecondary, navigationLink: AnyView(Text("Detail")))
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                    
//  DashboardMilestoneView(selectedMilestoneCategory: $selectedMilestoneCategory)
                }
            }
        }
    }
    
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen(name: "Ceroy")
    }
}

struct DashboardMilestoneView: View {
    
    @Binding var selectedMilestoneCategory: Int
    
    var body: some View {
        Group {
            HStack {
                Text("Milestone")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            
            Picker("Milestone", selection: $selectedMilestoneCategory) {
                Text("Sedang berlangsung")
                    .tag(1)
                
                Text("Telah tercapai")
                    .tag(2)
            }
            .pickerStyle(.segmented)
            .padding([.horizontal, .bottom])
            
            if selectedMilestoneCategory == 1 {
                ForEach(0 ..< 5) { item in
                    NavigationLink {
                        MilestoneDetailView()
                    } label: {
                        CardView(text: "Bisa mengangkat kepala mandiri hingga setinggi 45 derajat", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, isChecked: false, colorScheme: .dark)
                            .padding(.horizontal)
                            .padding(.bottom, 12)
                    }
                }
            } else {
                ForEach(0 ..< 5) { item in
                    CardView(text: "Bersuara tanpa arti, mamama, bababa, dadada, tatata", primaryColor: Color.ui.cognitivePrimary, secondaryColor: Color.ui.cognitiveSecondary, isChecked: true, colorScheme: .light)
                        .padding(.horizontal)
                        .padding(.bottom, 12)
                }
            }
        }
    }
}
