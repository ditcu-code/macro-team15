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
    //    let navigationLink: AnyView
    
    private func colorSwitcher() -> Color {
        switch category {
        case .cognitive:
            return Color.ui.cognitivePrimary
        case .motoric:
            return Color.ui.motorPrimary
        case .social:
            return Color.ui.socialPrimary
        case .language:
            return Color.ui.languagePrimary
        }
    }
    
    private func iconSwitcher() -> String {
        switch category {
        case .cognitive:
            return "puzzlepiece.fill"
        case .motoric:
            return "gearshape.fill"
        case .social:
            return "heart.fill"
        case .language:
            return "character.bubble.fill"
            
        }
    }
    
    var body: some View {
        
        DisclosureGroup {
            VStack {
                Spacer()
                
                if babyMilestone.count > 0 {
                    let sorted = babyMilestone.sorted(by: {$0.month < $1.month})
                    ForEach(sorted) { item in
                        ReportMilestoneView(milestone: MilestoneData.getAll().filter({$0.id == item.milestoneID}).first!, babyMilestone: item, color: colorSwitcher())
                    }
                } else {
                    NoReportMilestoneView(category: category)
                }
            }
            
        } label: {
            HStack {
                Image(systemName: iconSwitcher())
                    .font(.title)
                    .foregroundColor(colorSwitcher())
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
//
//struct MilestoneCategoryCardViewReport_Previews: PreviewProvider {
//    static var previews: some View {
//        MilestoneCategoryCardViewReport(category: .motoric, milestone: [Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil)])
//    }
//}
