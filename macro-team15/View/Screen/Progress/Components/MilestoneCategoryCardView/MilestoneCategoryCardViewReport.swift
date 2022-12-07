//
//  MilestoneCategoryCardViewV2Report.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct MilestoneCategoryCardViewReport: View {
    
    let category: MilestoneCategory
    let babyMilestone: [BabyMilestone]
    
    var body: some View {
        
        DisclosureGroup {
            VStack {
                Spacer()
                
                if babyMilestone.count > 0 {
                    let sorted = babyMilestone.sorted(by: {$0.month < $1.month})
                    ForEach(sorted) { item in
                        ReportMilestoneView(
                            milestone: MilestoneData.getAll().filter({$0.id == item.milestoneID}).first!,
                            babyMilestone: item,
                            color: CategoryCustomization.colorSwitcher(category)
                        )
                    }
                } else {
                    NoReportMilestoneView(category: category)
                }
            }
            
        } label: {
            HStack {
                Image(systemName: CategoryCustomization.iconSwitcher(category))
                    .font(.title)
                    .foregroundColor(CategoryCustomization.colorSwitcher(category))
                    .frame(maxWidth: 50)
                
                VStack(alignment: .leading) {
                    Text("\(category.rawValue)")
                        .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                    
                    Text("\(babyMilestone.count) milestone")
                        .font(.custom(FontType.light.rawValue, fixedSize: 16))
                }.foregroundColor(Color.ui.text)
                
                Spacer()
            }
        }
        .foregroundColor(Color.ui.text)
        .padding()
    }
    
}
