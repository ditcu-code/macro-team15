//
//  SwitchProfileSheet.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 29/11/22.
//

import SwiftUI

struct ProfileSwitcherSheet: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Profil Anak")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.ui.primary)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .font(.title)
                .fontWeight(.thin)
                .foregroundColor(Color.ui.primary)
            }
            .padding(28)
            
            Divider()
            
            ScrollView {
                ForEach(1..<3) { item in
                    Button {
                        // Insert function here
                        
                        dismiss()
                    } label: {
                        HStack {
                            ProfileAvatarView()
                                .frame(width: 40, height: 40)
                                .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                Text("Ceroy")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.ui.secondary)
                                
                                Text("0 tahun 2 bulan 20 hari")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                    .foregroundColor(Color.ui.text)
                            }
                            
                            Spacer()
                            
                            Button("Edit") {
                                
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.ui.primary)
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 28)
                    
                    Divider()
                }
            }
        }
        .presentationDetents([.medium, .large])
    }
    
}

struct ProfileSwitcherSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSwitcherSheet()
    }
}
