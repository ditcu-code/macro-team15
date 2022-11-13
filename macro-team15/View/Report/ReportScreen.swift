//
//  ReportScreen.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct ReportScreen: View {
    
    @State var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .top) {
                    
                    Color.ui.background
                        .frame(height: 225)
                    
                    VStack {
                        ProfileView()
                        
                        ProfileWeeklyStreakView()
                            .padding(.bottom)
                        
                        BadgesContainer(title: "Badges Terakhir", showSeeAll: true)
                    }
                }
            }
            
            .navigationTitle("Profile")
            .sheet(isPresented: $isSheetPresented) {
                BadgeDetailView(title: "Reward #1", subtitle: "Reward", acquiredDate: Date())
            }
        }
    }
}

struct ReportScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReportScreen()
    }
}

struct ProfileView: View {
    var body: some View {
        HStack(alignment: .top) {
            // Profile picture
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 100)
                
                Text("Edit foto")
                    .foregroundColor(.blue)
            }
            
            Spacer()
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                // Name
                Text("Nama")
                    .font(.subheadline)
                
                Text("Ceroy Carlo")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    // DOB
                    VStack(alignment: .leading) {
                        Text("Tanggal Lahir")
                            .font(.subheadline)
                        
                        Text("12 Juli 2022")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    
                    // Age
                    VStack(alignment: .leading) {
                        Text("Usia")
                            .font(.subheadline)
                        
                        Text("392 hari")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

struct ProfileWeeklyStreakView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Weekly Streak")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("15 hari")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }
            
            // Days
            HStack {
                ForEach(0 ..< 7) { item in
                    VStack {
                        Text("S")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.leading, 4)
                }
                .padding(.trailing, 4)
            }
            .padding(.vertical)
            
            // Streak description 1
            Text("You're only 1 week away from your final")
            
            // Streak description 2
            Text("Streak Society Reward!")
                .fontWeight(.semibold)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.ui.background, lineWidth: 4)
                .padding(.horizontal)
        )
    }
}
