//
//  BackgroundView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("BackgroundImage")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
