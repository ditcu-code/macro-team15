//
//  MissionView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 23/11/22.
//

import SwiftUI

struct MissionView: View {
    
    let missionTitle: String
    
    var body: some View {
        VStack {
            Image.ui.milestoneIcon.padding(.vertical)
            
            Text(missionTitle)
                .font(.custom(FontType.light.rawValue, size: 19))
                .foregroundColor(Color.ui.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
        }.padding()
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView(missionTitle: "Bisa menggerakkan kepala dari kiri/kanan ke tengah")
    }
}
