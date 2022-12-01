//
//  ReportMilestoneView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct ReportMilestoneView: View {
    
    let item: Milestone
    let color: Color
    let navigationLink: AnyView
    
    var body: some View {
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
                            .foregroundColor(color)
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
                        .foregroundColor(color)
                }
            }
        }
    }
    
}

struct ReportMilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        ReportMilestoneView(item: Milestone(id: 1, titleEN: "titleEN", title: "title", month: 1, warningMonth: 2, category: .motoric, stimulusID: nil), color: Color.ui.motorPrimary, navigationLink: AnyView(Text("Nav")))
    }
}
