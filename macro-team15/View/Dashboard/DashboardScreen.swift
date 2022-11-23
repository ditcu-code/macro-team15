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

                    ContentHeaderView(title: "Milestone", subtitle: "Perkembangan Ceroy di bulan ini", navigationLink: nil)
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
                    
                    ContentHeaderView(title: "Catatan", subtitle: "Hal-hal penting mengenai perkembangan Ceroy", navigationLink: AnyView(Text("Detail")))
                        .padding(.top)
                    
                    Text("Tidak ada catatan penting")
                        .padding(.vertical, 80)
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
