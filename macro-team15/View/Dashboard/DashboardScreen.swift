//
//  Dashboard.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 31/10/22.
//

import SwiftUI

struct DashboardScreen: View {
    var body: some View {
        StackCircularProgress(values: [40, 100, 20, 100, 30, 100])
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
