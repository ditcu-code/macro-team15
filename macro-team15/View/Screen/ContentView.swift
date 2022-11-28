//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @AppStorage("isDoneOnboarding") var isDoneOnboarding: Bool = false

    var body: some View {
        if (isDoneOnboarding || !viewModel.babies.isEmpty) {
            TabViews(viewModel: viewModel)
        } else {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabViews: View {
    @State private var selectedTab: Tabs = .home
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardScreen(name: viewModel.babies[0].name ?? "")
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
