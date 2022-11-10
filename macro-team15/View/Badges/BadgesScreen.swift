//
//  Badges.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 08/11/22.
//

import SwiftUI

struct BadgesScreen: View {
    
    var body: some View {
        ScrollView {
            BadgesContainer(title: "General")
            BadgesContainer(title: "Stimulus")
        }
        .navigationTitle("Badges")
    }
}

struct BadgesScreen_Previews: PreviewProvider {
    static var previews: some View {
        BadgesScreen()
    }
}
