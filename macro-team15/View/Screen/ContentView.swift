//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .home
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        if (viewModel.babies.isEmpty) {
            OnboardingView()
        } else {
            TabView(selection: $selectedTab) {
                DashboardScreen(name: viewModel.babies[0].name ?? "")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tabs.home)
                
                MilestoneScreen()
                    .tabItem {
                        Label("Milestone", systemImage: "figure.walk")
                    }
                    .tag(Tabs.milestone)
                
                ReportScreen()
                    .tabItem {
                        Label("Report", systemImage: "newspaper")
                    }
                    .tag(Tabs.report)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
