//
//  TuntunLoading.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 29/11/22.
//

import SwiftUI

struct TuntunLoading: View {
    @State private var degree: Double = 0.0
    
    var body: some View {
        Image.ui.tuntunHand.rotationEffect(.degrees(degree), anchor: .bottomLeading)
            .onAppear {
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    degree = 30
                }
            }
    }
}

struct TuntunLoading_Previews: PreviewProvider {
    static var previews: some View {
        TuntunLoading()
    }
}
