//
//  BackgroundView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("BackgroundFill1Image")
            Image("BackgroundFill2Image")
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .edgesIgnoringSafeArea(.all)
    }
}
