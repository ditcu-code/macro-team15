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
            VStack(spacing: 20) {
                Image.ui.tummyTime
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 120)
                    .padding(.horizontal, 30)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.custom(FontType.semiBold.rawValue, size: 16))
                        .lineLimit(2)
                        .padding(.bottom, 4)
                        .foregroundColor(Color.ui.secondary)
                        
                    Text(subtitle)
                        .font(.custom(FontType.light.rawValue, size: 13))
                        .foregroundColor(Color.ui.text)
                }
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 15)
            }
            .frame(width: 200, height: 280)
            .background(
                Color.white
            )
            .cornerRadius(20)
            .padding(.trailing)
            .padding(.vertical, 5)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
        }
    }
}

struct ActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif! ", navigationLink: AnyView(Text("Detail")))
    }
}

struct ActivityCardViewV2: View {
    
    let stimulus: Stimulus
    let allStimulus: [Stimulus]
    
    var body: some View {
        NavigationLink {
            StimulusDetailView(stimulus: stimulus, allStimulus: allStimulus)
        } label: {
            VStack(spacing: 20) {
                Image.ui.tummyTime
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 120)
                    .padding(.horizontal, 30)
                
                VStack(alignment: .leading) {
                    Text(stimulus.activityName)
                        .font(.custom(FontType.semiBold.rawValue, size: 16))
                        .lineLimit(2)
                        .padding(.bottom, 4)
                        .foregroundColor(Color.ui.secondary)
                        
                    Text("Aktivitas ini dapat mendukung pencapaian \(StringManipulation.categoryStimulus(cat: stimulus.categories))")
                        .font(.custom(FontType.light.rawValue, size: 13))
                        .foregroundColor(Color.ui.text)
                }
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 15)
            }
            .frame(width: 200, height: 280)
            .background(
                Color.white
            )
            .cornerRadius(20)
//            .padding(.trailing)
            .padding([.vertical, .trailing], 5)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
        }
    }
}
