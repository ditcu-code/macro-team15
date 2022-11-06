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
    let withColor: Bool
    
    var body: some View {
        VStack {
            MilestoneProgressHeaderView(title: title, age: age)
            
            MilestoneProgressCompactContentView(withColor: withColor)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
    
}

struct MilestoneProgressCompactView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneProgressCompactView(title: "Bulan Ke-1", age: 23, withColor: true)
            .background(Color.yellow)
    }
}

struct MilestoneProgressCompactContentView: View {
    
    let withColor: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.motorPrimary)
                MilestoneProgressCategoryView(category: "Motorik", color: !withColor ? Color.ui.disabledText : Color.ui.motorPrimary)
            }
            .padding(.trailing, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.cognitivePrimary)
                MilestoneProgressCategoryView(category: "Kognitif", color: !withColor ? Color.ui.disabledText : Color.ui.cognitivePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.languagePrimary)
                MilestoneProgressCategoryView(category: "Bahasa", color: !withColor ? Color.ui.disabledText : Color.ui.languagePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.socialPrimary)
                MilestoneProgressCategoryView(category: "Sosial & Emosional", color: !withColor ? Color.ui.disabledText : Color.ui.socialPrimary)
            }
        }
    }
    
}
