//
//  MissionView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 23/11/22.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image.ui.placeholder
            
            Text("Bisa menggerakkan kepala dari kiri/kanan ke tengah")
                .font(.title2)
                .foregroundColor(Color.ui.secondary)
                .frame(maxWidth: 300)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
    }
}
