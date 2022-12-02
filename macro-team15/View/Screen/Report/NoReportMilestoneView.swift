//
//  NoReportMilestoneView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 30/11/22.
//

import SwiftUI

struct NoReportMilestoneView: View {
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)
            
            HStack {
                Image.ui.tuntunHead
                    .resizable()
                    .frame(width: 75, height: 75)
                    .padding(.horizontal)
                
                Text("Semua Milestone Motorik telah tercapai sesuai bulan perkembangan")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(Color.ui.secondary)
            }
            .padding(.vertical)
        }
    }
}

struct NoReportMilestoneView_Previews: PreviewProvider {
    static var previews: some View {
        NoReportMilestoneView()
            .padding()
    }
}
