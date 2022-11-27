//
//  StimulusMaterialView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusMaterialView: View {
    var body: some View {
        HStack {
            Image.ui.placeholder
                .resizable()
                .frame(width: 100, height: 75)
                .aspectRatio(contentMode: .fill)
            
            Text("Buku bergambar")
                .fontWeight(.semibold)
                .foregroundColor(Color.ui.secondary)
                .frame(width: 90)
                .lineLimit(3)
        }
    }
}

struct StimulusMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusMaterialView()
    }
}
