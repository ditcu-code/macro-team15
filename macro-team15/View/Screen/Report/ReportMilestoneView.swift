//
//  ReportMilestoneView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct ReportMilestoneView: View {
    
    let milestone: Milestone
    let babyMilestone: BabyMilestone
    let color: Color
//    let navigationLink: AnyView
    
    var body: some View {
        NavigationLink {
            MilestoneDetailViewV2(milestone: milestone, cdMilestone: babyMilestone)
        } label: {
            VStack {
                Divider()
                
                HStack {
                
//                    Button {
//                    } label: {
//                        Image(systemName: babyMilestone.isChecked ? "checkmark.circle.fill" : "checkmark.circle")
//                            .resizable()
//                            .frame(width: 28, height: 28)
//                            .foregroundColor(color)
//                    }
//                    .padding(12)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(milestone.title)
                            .font(.custom(FontType.light.rawValue, fixedSize: 14))
                            .multilineTextAlignment(.leading)
                        
                        Text("Bulan ke-\(milestone.month)")
                            .font(.custom(FontType.semiBold.rawValue, fixedSize: 12))
                            .foregroundColor(Color.ui.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(color)
                }
            }
        }
    }
    
}

//struct ReportMilestoneView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReportMilestoneView(item: Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil), color: Color.ui.motorPrimary)
//    }
//}
