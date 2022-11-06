//
//  MilestoneProgressCompactView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 06/11/22.
//

import SwiftUI

struct MilestoneProgressCompactView: View {
    
    let title: String
    let age: Int
    
    var body: some View {
        VStack {
            MilestoneProgressHeaderView(title: title, age: age)
            
            MilestoneProgressCompactContentView()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
    
}

struct MilestoneProgressCompactView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneProgressCompactView(title: "Bulan Ke-1", age: 23)
            .background(Color.yellow)
    }
}

struct MilestoneProgressCompactContentView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.motorPrimary)
                MilestoneProgressCategoryView(category: "Motorik", color: Color.ui.motorPrimary)
            }
            .padding(.trailing, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.cognitivePrimary)
                MilestoneProgressCategoryView(category: "Kognitif", color: Color.ui.cognitivePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.languagePrimary)
                MilestoneProgressCategoryView(category: "Bahasa", color: Color.ui.languagePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.socialPrimary)
                MilestoneProgressCategoryView(category: "Sosial & Emosional", color: Color.ui.socialPrimary)
            }
        }
    }
}
