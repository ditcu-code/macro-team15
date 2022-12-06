//
//  StimulusPhotoCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct StimulusPhotoCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            PhotoCardView()
            
            Group {
                Text("Bulan ke-1")
                    .font(.footnote)
                    .foregroundColor(Color.ui.text)
                
                Text("Tummy Time")
                    .font(.title3)
                    .foregroundColor(Color.ui.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 4)
                
                Text(Date().dmYFormat())
                    .font(.footnote)
                    .foregroundColor(Color.ui.text)
                    .padding(.top, 4)
                    .padding(.bottom, 12)
            }
            .padding(.horizontal)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 12)
        }
    }
}

struct StimulusPhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusPhotoCardView()
    }
}
