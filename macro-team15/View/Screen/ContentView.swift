//
//  ContentView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    @ObservedObject var appData = AppData()
    
    var body: some View {
        if (appData.isDoneOnboarding || !vm.babies.isEmpty) {
            if (vm.babies.count > 0 || appData.userHasInstalled) {
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
    var appData = AppData()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ProgressView()
                .tabItem {
                    Label("Progres", systemImage: "rectangle.stack.fill")
                }
                .tag(Tabs.home)
            
            ReportView()
                .tabItem {
                    Label("Rapor", systemImage: "list.bullet.rectangle")
                }
                .tag(Tabs.milestone)
            
//            AlbumScreen(name: "Aruna")
//                .tabItem {
//                    Label("Album", systemImage: "photo.on.rectangle")
//                }
//                .tag(Tabs.report)
        }
        .onAppear {
            NotificationManager.instance.requestAuthorization()
        }
        .onDisappear {
            AppData.setSelectedMonth(appData.babyAgeMonth)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
