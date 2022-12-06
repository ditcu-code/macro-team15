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
                .font(.custom(FontType.semiBold.rawValue, size: 12, relativeTo: .caption))
                .foregroundColor(Color.ui.secondary)
            
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
