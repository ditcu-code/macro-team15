//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            DashboardScreen(name: "Ceroy Carlo", age: 23)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
