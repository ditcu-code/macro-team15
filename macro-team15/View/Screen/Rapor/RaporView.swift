//
//  RaporView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct RaporView: View {
    var name = "Ceroy"
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Perkembangan Milestone\n\(name)")
                    .font(.title.bold())
                    .foregroundColor(Color.ui.primary)
                    .multilineTextAlignment(.center)
                RadarChart(
                    data: [9.0, 14.0, 15.0, 20.0],
                    dataVersus: [10.0, 18.0, 19.0, 23.0],
                    max: [12.0, 20.0, 25.0, 35.0],
                    gridColor: .black,
                    dataColor: Color.ui.primary.opacity(0.5)
                ).frame(width: UIScreen.main.bounds.height - 50, height: UIScreen.main.bounds.width - 50)
            }
        }
    }
}

struct RaporView_Previews: PreviewProvider {
    static var previews: some View {
        RaporView()
    }
}
