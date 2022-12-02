//
//  StimulusCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct ActivityCardLongView: View {
    
    let navigationLink: AnyView
    
    var body: some View {
        NavigationLink {
            navigationLink
        } label: {
            HStack(spacing: 28) {
                Image.ui.tuntunStimulus
                    .resizable()
                    .frame(width: 343/4, height: 427/4)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Gantung mainan dihadapan anak")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.ui.secondary)
                    
                    Text("Aktivitas ini dapat mendukung pencapaian motorik!")
                        .font(.caption)
                        .fontWeight(.light)
                        .foregroundColor(Color.ui.text)
                }
                .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 28)
            .padding(.horizontal, 28)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.1), radius: 6)
            }
        }
        .padding(.horizontal)
    }
    
}

struct StimulusCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardLongView(navigationLink: AnyView(ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!", navigationLink: AnyView(StimulusDetailView()))))
    }
}
