//
//  PhotoCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct PhotoCardView: View {
    var body: some View {
        Image.ui.placeholder
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 200)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .clipped()
    }
}

struct PhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCardView()
    }
}
