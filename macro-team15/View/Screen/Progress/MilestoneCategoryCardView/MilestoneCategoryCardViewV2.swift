//
//  MilestoneCategoryCardViewV2.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 30/11/22.
//

import SwiftUI

struct MilestoneCategoryCardViewV2: View {
    
    let category: MilestoneCategory
    let milestone: [Milestone]
    let navigationLink: AnyView
    
    //    @ObservedObject var vm: MilestoneCategoryCardViewModel = MilestoneCategoryCardViewModel()
    @State var refreshID: Int = 0
    
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
                
                ForEach(milestone, id: \.id) { item in
                    if let babyMiles = BabyMilestone.getSpecificMilestone(with: Int16(item.id)) {
                        NavigationLink {
                            navigationLink
                        } label: {
                            VStack {
                                Divider()
                                
                                HStack {
                                    Button {
                                        babyMiles.isChecked.toggle()
                                        PersistenceController.shared.save()
                                        
                                        refreshID += 1
                                    } label: {
                                        Image(systemName: babyMiles.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundColor(colorSwitcher())
                                            .id(refreshID)
                                    }.padding(12)
                                    
                                    Text(item.title).multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right").foregroundColor(colorSwitcher())
                                }
                            }
                        }
                    }
                }
            }
            
        } label: {
            
            HStack {
                Image(systemName: iconSwitcher())
                    .font(.title)
                    .foregroundColor(colorSwitcher())
                    .frame(maxWidth: 50)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(category.rawValue)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("(1/\(milestone.count))")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    Capsules(milestone: milestone, color: colorSwitcher()).id(refreshID)
                }
                
                Spacer()
            }
            
        }
        .foregroundColor(Color.ui.text)
        .padding()
    }
}


struct Capsules: View {
    var milestone: [Milestone]
    var color: Color
    
    func sortCaps() -> [BabyMilestone] {
        var babyMilestones: [BabyMilestone] = []
        
        milestone.forEach { item in
            if let babyMiles = BabyMilestone.getSpecificMilestone(with: Int16(item.id)) {
                babyMilestones.append(babyMiles)
            }
        }
        
        return babyMilestones.sorted { $0.isChecked && !$1.isChecked }
    }
    
    var body: some View {
        HStack {
            ForEach(sortCaps()) { item in
                Capsule()
                    .frame(width: 32)
                    .foregroundColor(color.opacity(item.isChecked ? 1 : 0.3))
            }
        }
    }
    
}
