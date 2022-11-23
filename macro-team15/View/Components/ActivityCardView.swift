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
                ZStack(alignment: .topTrailing) {
                    Image("PlaceholderImage")
                        .resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                    
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color.ui.motorPrimary)
                            .padding(4)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                            )
                            .padding(.trailing, -8)
                        
                        Image(systemName: "puzzlepiece.fill")
                            .foregroundColor(Color.ui.cognitivePrimary)
                            .padding(4)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                            )
                            .padding(.trailing, -8)
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color.ui.socialPrimary)
                            .padding(4)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                            )
                            .padding(.trailing, -8)
                        
                        Image(systemName: "character.bubble.fill")
                            .foregroundColor(Color.ui.languagePrimary)
                            .padding(4)
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                            )
                            .padding(.trailing, -8)
                    }
                    .padding(.top, 8)
                    .padding(.trailing)
                }
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.callout)
                        .bold()
                        .padding(.bottom, 4)
                        .foregroundColor(Color.ui.text)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(Color.ui.text)
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
