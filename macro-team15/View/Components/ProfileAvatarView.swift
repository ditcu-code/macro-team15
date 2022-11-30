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

struct ProfileAvatarViewV2: View {
    let photo: Data?
    
    var body: some View {
        if let photo = photo,
           let uiImage = UIImage(data: photo) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 35, height: 35)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(minWidth: 35, minHeight: 35)
        }
    }
}
