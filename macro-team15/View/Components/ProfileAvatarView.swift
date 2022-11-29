//
//  ProfileAvatarView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct ProfileAvatarView: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(minWidth: 35, minHeight: 35)
    }
}

struct ProfileAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAvatarView()
    }
}
