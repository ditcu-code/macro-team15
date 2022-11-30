//
//  MilestoneCategoryCardViewV2Report.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct MilestoneCategoryCardViewV2Report: View {
    
    let category: MilestoneCategory
    let milestone: [Milestone]
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
                
                ForEach(milestone) { item in
                    NavigationLink {
                        navigationLink
                    } label: {
                        VStack {
                            Divider()
                            
                            HStack {
                                Button {
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(colorSwitcher(true))
                                }
                                .padding(12)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.title)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("Bulan ke-\(item.month)")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.ui.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(colorSwitcher(true))
                            }
                        }
                    }
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
                    
                    Text("\(milestone.count) misi")
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
        MilestoneCategoryCardViewV2Report(category: .motoric, milestone: [Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil)], navigationLink: AnyView(Text("Nav")))
    }
}
