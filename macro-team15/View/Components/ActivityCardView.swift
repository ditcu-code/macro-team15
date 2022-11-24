//
//  ActivityCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 22/11/22.
//

import SwiftUI

struct ActivityCardView: View {
    
    let title: String
    let subtitle: String
    let navigationLink: AnyView
    
    var body: some View {
        NavigationLink {
            navigationLink
        } label: {
            VStack {
                Image("PlaceholderImage")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.callout)
                        .bold()
                        .padding(.bottom, 4)
                        .foregroundColor(Color.ui.primary)
                    
                    Text(subtitle)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.caption)
                        .foregroundColor(Color.ui.text)
                        .multilineTextAlignment(.leading)
                }
                .padding([.bottom, .horizontal], 12)
            }
            .frame(maxWidth: 200)
            .background(
                Color.white
                    .shadow(radius: 10)
            )
            .cornerRadius(20)
            .padding(.trailing)
        }
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!", navigationLink: AnyView(Text("Detail")))
    }
}
