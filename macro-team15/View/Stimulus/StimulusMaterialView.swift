//
//  StimulusMaterialView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusMaterialView: View {
    var material: ActivityMaterial
    
    var body: some View {
        HStack(spacing: 10) {
            Image("bukuBergambar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 75)
            
            Text(material.name)
                .font(.custom(FontType.semiBold.rawValue, size: 14))
                .foregroundColor(Color.ui.secondary)
                .lineLimit(3)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: 200)
    }
}

struct StimulusMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusMaterialView(material: MaterialData.getAll()[1])
    }
}
