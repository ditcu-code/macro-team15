//
//  EmptyView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 04/12/22.
//

import SwiftUI

struct EmptyView: View {
    var note: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image.ui.tuntunNoNote
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 125)
            
            Text(note)
                .font(.custom(FontType.semiBold.rawValue, size: 14))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.ui.secondary)
        }
        .frame(width: 320)
        .padding([.top, .horizontal])
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(note: "Belum ada aktivitas yang dirancang untuk milestone ini")
    }
}
