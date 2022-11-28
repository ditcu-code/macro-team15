//
//  MilestonePhotoCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct MilestonePhotoCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            PhotoCardView()
            
            Group {
                Text("Bulan ke-1")
                    .font(.title3)
                    .foregroundColor(Color.ui.secondary)
                    .padding(.bottom, 4)
                
                Text("Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap!")
                    .font(.footnote)
                
                Text(Date().dmYFormat())
                    .font(.footnote)
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

struct MilestonePhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        MilestonePhotoCardView()
    }
}
