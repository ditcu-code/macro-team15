//
//  MilestoneScreen.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct MilestoneScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.background
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    MilestoneProgressCompactView(title: "Bulan Ke-1", age: 23, withColor: true)
                        .padding([.top, .horizontal])
                    
                    MilestoneProgressCompactView(title: "Bulan Ke-2", age: 15, withColor: true)
                        .padding([.top, .horizontal])
                    
                    MilestoneProgressFullView(title: "Bulan Ke-3", age: 15, withColor: true)
                        .padding([.top, .horizontal])
                    
                    MilestoneProgressCompactView(title: "Bulan Ke-4", age: 0, withColor: false)
                        .padding([.top, .horizontal])
                    
                    MilestoneProgressCompactView(title: "Bulan Ke-5", age: 0, withColor: false)
                        .padding([.top, .horizontal])
                
                    MilestoneProgressCompactView(title: "Bulan Ke-6", age: 0, withColor: false)
                        .padding([.top, .horizontal])
                    
                    MilestoneProgressCompactView(title: "Bulan Ke-7", age: 0, withColor: false)
                        .padding([.top, .horizontal])
                
                    MilestoneProgressCompactView(title: "Bulan Ke-8", age: 0, withColor: false)
                        .padding([.top, .horizontal])
                        .padding(.bottom)
                }
            }
        }
    }
}

struct MilestoneScreen_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneScreen()
    }
}
