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
        ZStack(alignment: .bottom) {
            Image.ui.placeholder
            
            Text(missionTitle)
                .font(.title2)
                .foregroundColor(Color.ui.secondary)
                .frame(maxWidth: 300)
        }
    }
    
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView(missionTitle: "Bisa menggerakkan kepala dari kiri/kanan ke tengah")
    }
}
