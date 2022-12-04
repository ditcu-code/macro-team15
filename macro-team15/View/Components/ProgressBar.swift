//
//  ProgressBar.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 04/12/22.
//

import SwiftUI

struct ProgressBar: View {
    
    let currentProgress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(.black.opacity(0.1))
                .frame(width: UIScreen.main.bounds.width - 60, height: 15)
                .padding(.horizontal)
            
            Capsule()
                .foregroundColor(Color.ui.primary)
                .frame(width: (UIScreen.main.bounds.width - 60) * currentProgress, height: 16)
                .padding(.horizontal)
        }
    }
    
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(currentProgress: 0.3)
    }
}
