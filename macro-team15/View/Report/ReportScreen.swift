//
//  ReportScreen.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct ReportScreen: View {
    var body: some View {
        ScrollView {
            ProfileView()
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
                Image(systemName: "person.circle.fill")
                    .resizable()
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
        .padding(.horizontal)
    }
}
