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
    let context = PersistenceController.viewContext
    @ObservedObject var vm: MilestoneCategoryCardViewModel = MilestoneCategoryCardViewModel()
    
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
                                    
//                                    let babyMilestone = BabyMilestone(context: context)
//                                    babyMilestone.baby = vm.appData.currentBaby
//                                    babyMilestone.id = UUID()
//                                    babyMilestone.checkedDate = Date()
//                                    babyMilestone.isChecked = true
//                                    babyMilestone.milestoneID = Int16(item.id)
//                                    
//                                    PersistenceController.shared.save()
                                    
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(colorSwitcher(true))
                                }.padding(12)
                                
                                Text(item.title).multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right").foregroundColor(colorSwitcher(true))
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
                    HStack {
                        Text("\(category.rawValue)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("(1/\(milestone.count))")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        ForEach(milestone) { item in
                            Capsule()
                                .frame(width: 32)
                                .foregroundColor(colorSwitcher(true))
                        }
                    }
                }
                
                Spacer()
            }
            
        }
        .foregroundColor(Color.ui.text)
        .padding()
    }
}


