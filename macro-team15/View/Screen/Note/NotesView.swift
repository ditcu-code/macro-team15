//
//  NotesView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        ScrollView {
            Spacer()
                .padding(.top)
            
            ForEach(0 ..< 8) { item in
                NoteView(title: "Judul Catatan", description: "Isi catatan", date: Date(), navigationLink: AnyView(NoteDetailView(title: "Judul Catatan", note: "Isi catatan")))
                    .padding(.bottom)
            }
        }
        .background(BackgroundView())
        
        .navigationTitle(Text("Catatan"))
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotesView()
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
