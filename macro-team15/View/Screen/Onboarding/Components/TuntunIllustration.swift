//
//  TuntunIllustration.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct TuntunIllustration: View {
    @Binding var step: Int
    @State private var degree: Double = 0.0
    @State private var horizontal: Double = 30.0
    
    var body: some View {
        HStack {
            Group {
                Image.ui.tuntunHead.padding(.leading)
                Image
                    .ui
                    .tuntunHand
                    .rotationEffect(.degrees(degree), anchor: .bottomLeading)
                    .onAppear {
                        if step == 0 {
                            withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                                degree = 30
                            }
                            withAnimation(.linear) {
                                horizontal = 0
                            }
                        }
                    }
            }
        }.offset(y: step == 0 ? horizontal : 0)
    }
}
