//
//  DashboardHeaderView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct DashboardHeaderView: View {
    
    let name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                // Milestone dropdown
                Button {
                    
                } label: {
                    Text("Bulan ke-1")
                        .font(.title3)
                    .fontWeight(.bold)
                    
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(Color.ui.text)
                
                Spacer()
                
                // Profile image
                Button {
                    
                } label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            
            Spacer()
            
            // Baby's name
            Text("Hi, \(name)!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.ui.text)
                .padding(.bottom, 8)
        }
        .padding(.horizontal)
    }
    
}

struct DashboardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardHeaderView(name: "Ceroy")
    }
}
