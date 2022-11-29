//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @AppStorage("isDoneOnboarding") var isDoneOnboarding: Bool = false
    
    var body: some View {
        if (isDoneOnboarding || !viewModel.babies.isEmpty) {
            if (viewModel.babies.count > 0) {
                TabViews()
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
            
            MilestoneScreen()
                .tabItem {
                    Label("Rapor", systemImage: "list.bullet.rectangle")
                }
                .tag(Tabs.milestone)
            
            ReportScreen()
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
