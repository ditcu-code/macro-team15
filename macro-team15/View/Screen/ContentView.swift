//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @ObservedObject var appData = AppData()
    
    var body: some View {
        if (viewModel.appData.isDoneOnboarding || !viewModel.babies.isEmpty) {
            if (viewModel.babies.count > 0) {
                TabViews()
                    .onAppear {
                        if viewModel.appData.currentBabyId.isEmpty {
                            viewModel.setCurrentBabyId()
                        }
                    }
            } else {
                TuntunLoading()
            }
        } else {
            OnboardingView()
        }
    }
}

struct TabViews: View {
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardScreen()
                .tabItem {
                    Label("Progres", systemImage: "rectangle.stack.fill")
                }
                .tag(Tabs.home)
            
            ReportView()
                .tabItem {
                    Label("Rapor", systemImage: "list.bullet.rectangle")
                }
                .tag(Tabs.milestone)
            
            AlbumScreen(name: "Aruna")
                .tabItem {
                    Label("Album", systemImage: "photo.on.rectangle")
                }
                .tag(Tabs.report)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
