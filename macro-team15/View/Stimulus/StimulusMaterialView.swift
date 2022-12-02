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
        HStack(spacing: 20) {
            Image("bukuBergambar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 75)
            
            Text(material.name)
                .font(.custom(FontType.semiBold.rawValue, size: 14))
                .foregroundColor(Color.ui.secondary)
                .frame(width: 100)
                .lineLimit(3)
            
        }
    }
}

struct StimulusMaterialView_Previews: PreviewProvider {
    static var previews: some View {
        StimulusMaterialView(material: MaterialData.getAll()[1])
    }
}
