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
            .aspectRatio(contentMode: .fill)
            .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

struct PhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCardView()
    }
}
