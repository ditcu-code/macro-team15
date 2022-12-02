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
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .bold()
                        .foregroundColor(Color.ui.secondary)
                        .frame(maxWidth: UIScreen.main.bounds.size.width - 140)
                        .lineLimit(nil)
                        .fixedSize()
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(Color.ui.primary)
                        .font(.system(size: 22))
                        .bold()
                }
                .padding(.bottom)
                
                HStack() {
                    Text(description)
                        .foregroundColor(Color.ui.text)
                        .frame(maxWidth: UIScreen.main.bounds.size.width - 140)
                        .lineLimit(nil)
                        .fixedSize()
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Text(date.shortdmYFormat())
                        .font(.footnote)
                        .foregroundColor(Color.ui.text)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 3, x: 1, y: 1)
            )
            .padding(.horizontal)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(title: "Judul Catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "Judul catatan", note: "Isi catatan")))
    }
}
