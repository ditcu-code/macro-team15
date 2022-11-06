//
//  Dashboard.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct DashboardScreen: View {
    
    let name: String
    let age: Int
    
    @State private var selectedMilestoneCategory = 1
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea([.bottom, .horizontal])
            
            ScrollView {
                DashboardHeaderView(name: name)
                
                MilestoneProgressFullView(title: "Milestone Progress", age: age)
                
                DashboardMilestoneView(selectedMilestoneCategory: $selectedMilestoneCategory)
            }
        }
    }
    
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen(name: "Ceroy Carlo", age: 23)
    }
}

struct DashboardHeaderView: View {
    
    let name: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("Hi, \(name)!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.ui.text)
            
            Spacer()
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding(.top, 32)
        .padding([.bottom, .horizontal])
        .background(Color.white)
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
                    CardView(text: "Bisa mengangkat kepala mandiri hingga setinggi 45 derajat", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, isChecked: false, colorScheme: .dark)
                        .padding(.horizontal)
                        .padding(.bottom, 12)
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
