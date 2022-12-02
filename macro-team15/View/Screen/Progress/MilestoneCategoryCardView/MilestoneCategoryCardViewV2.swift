//
//  MilestoneCategoryCardViewV2Report.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct MilestoneCategoryCardViewV2: View {
    
    let category: MilestoneCategory
    let milestone: [Milestone]?
    let navigationLink: AnyView
    
    private func colorSwitcher(_ isPrimary: Bool) -> Color {
        switch category {
        case .cognitive:
            if isPrimary {
                return Color.ui.cognitivePrimary
            } else {
                return Color.ui.cognitiveSecondary
            }
            
        case .motoric:
            if isPrimary {
                return Color.ui.motorPrimary
            } else {
                return Color.ui.motorSecondary
            }
            
        case .social:
            if isPrimary {
                return Color.ui.socialPrimary
            } else {
                return Color.ui.socialSecondary
            }
            
        case .language:
            if isPrimary {
                return Color.ui.languagePrimary
            } else {
                return Color.ui.languageSecondary
            }
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
                
                if let milestone = milestone {
                    ForEach(milestone.indices) { index in
                        if index == 0 {
                            Spacer()
                                .padding(.top, 12)
                        }
                        
                        ReportMilestoneView(item: milestone[index], color: colorSwitcher(true), navigationLink: navigationLink)
                    }
                } else {
                    NoReportMilestoneView()
                }
            }
            
        } label: {
            HStack {
                Image(systemName: iconSwitcher())
                    .font(.title)
                    .foregroundColor(colorSwitcher(true))
                    .frame(maxWidth: 50)
                
                VStack(alignment: .leading) {
                    Text("\(category.rawValue)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.ui.secondary)
                    
                    Text("\(milestone?.count ?? 0) misi")
                        .fontWeight(.medium)
                        .foregroundColor(Color.ui.text)
                }
                
                Spacer()
            }
        }
        .foregroundColor(Color.ui.text)
        .padding()
    }
    
}

struct MilestoneCategoryCardViewV2Report_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneCategoryCardViewV2(category: .motoric, milestone: [Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil)], navigationLink: AnyView(Text("Nav")))
        
        MilestoneCategoryCardViewV2(category: .motoric, milestone: nil, navigationLink: AnyView(Text("Nav")))
    }
}
