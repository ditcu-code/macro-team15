//
//  NoteView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 24/11/22.
//

import SwiftUI

struct NoteView: View {
    
    let title: String
    let description: String
    let date: Date
    let navigationLink: AnyView
    
    var body: some View {
        NavigationLink {
            navigationLink
        } label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(title)
                        .bold()
                        .foregroundColor(Color.ui.secondary)
                    
                    Text(date.dmYFormat())
                        .font(.footnote)
                        .foregroundColor(Color.ui.text)
                    
                    Text(description)
                        .foregroundColor(Color.ui.text)
                }
                
                Spacer()
                
                Image(systemName: "bookmark.fill")
                    .foregroundColor(Color.ui.primary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 3, x: 1, y: 1)
            )
            .padding()
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(title: "Judul Catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "Judul catatan", note: "Isi catatan")))
    }
}
