//
//  Dashboard.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct DashboardScreen: View {
    @State private var selectedMilestoneCategory = 1
    @ObservedObject var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    BackgroundView()
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        HighlightedStimulusView(withCTA: true)
                        
                        Divider()
                            .padding(.vertical)

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
                            MilestoneCategoryCardView(categoryTitle: "Motorik", missionTitle: "Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, navigationLink: AnyView(MilestoneDetailView()))
                            
                            Divider()
                            
                            // Cognitive
                            MilestoneCategoryCardView(categoryTitle: "Kognitif", missionTitle: "Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap", primaryColor: Color.ui.cognitivePrimary, secondaryColor: Color.ui.cognitiveSecondary, navigationLink: AnyView(MilestoneDetailView()))
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
                
                .navigationTitle("\(geo.frame(in: .global).minY < 100 ? "Beranda" : "Hi, \(viewModel.babies.first?.name ?? "Aruna")!")")
                .toolbar {
                    // Milestone dropdown
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack(alignment: .bottom) {
                            Button {
                                
                            } label: {
                                Text("Bulan ke-1")
                                
                                Image(systemName: "chevron.down")
                                    .padding(.leading, -4)
                            }
                            .font(.headline)
                            .foregroundColor(Color.ui.text)
                        }
                    }
                    
                    // Profile image
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ProfileAvatarView()
                    }
                }
            }
        }
    }
    
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
