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
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(title)
                    .font(.custom(FontType.semiBold.rawValue, size: 21))
                
                Text(subtitle)
                    .font(.custom(FontType.light.rawValue, size: 13))
                
            }.foregroundColor(Color.ui.secondary)
            
            
            Spacer()
            
            if let link = navigationLink {
                NavigationLink("Lihat semua") {
                    link
                }
                .buttonStyle(SecondaryButtonStyle())
            }
        }
        .padding([.bottom, .horizontal])
    }
    
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHeaderView(title: "Aktivitas", subtitle: "Dirancang untuk mendukung pencapaian Ceroy", navigationLink: AnyView(Text("")))
            .frame(height: 100)
    }
}
