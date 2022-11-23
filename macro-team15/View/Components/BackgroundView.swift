//
//  BackgroundView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 21/11/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color("BackgroundColor")
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .edgesIgnoringSafeArea(.all)
    }
}
