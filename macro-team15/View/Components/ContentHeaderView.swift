//
//  ContentHeaderView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 22/11/22.
//

import SwiftUI

struct ContentHeaderView: View {
    
    let title: String
    let subtitle: String
    let navigationLink: AnyView?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.ui.primary)
                
                Spacer()
                
                if let link = navigationLink {
                    NavigationLink("Lihat semua") {
                        link
                    }
                    .foregroundColor(Color.ui.primary)
                }
            }
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(Color.ui.secondary)
        }
        .padding(.horizontal)
    }
    
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: AnyView(Text("")))
    }
}
