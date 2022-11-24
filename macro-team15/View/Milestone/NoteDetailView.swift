//
//  NoteDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 24/11/22.
//

import SwiftUI

struct NoteDetailView: View {
    
    @State var note: String
    @FocusState private var noteIsFocused: Bool
    
    var body: some View {
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            
            VStack {
                MissionView(missionTitle: "Bisa menggerakkan kepala dari kiri/kanan ke tengah")
               
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $note)
                        .focused($noteIsFocused)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .shadow(radius: 1)
                        )
                        .padding()
                    
                    if note.isEmpty {
                        TextField("Tulis catatan", text: $note)
                            .disabled(true)
                            .padding(40)
                    }
                }
            }
        }
        
        .navigationTitle("Catatan")
        .toolbar {
            ToolbarItem {
                if noteIsFocused {
                    Button {
                        noteIsFocused = false
                    } label: {
                        Text("Done")
                            .foregroundColor(Color.ui.primary)
                    }
                } else {
                    Menu {
                        Button {
                            
                        } label: {
                            Label("Penting", systemImage: "bookmark")
                        }

                        Button(role: .cancel) {
                            
                        } label: {
                            Label("Bagikan", systemImage: "square.and.arrow.up")
                        }
                        
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Hapus", systemImage: "trash.fill")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(Color.ui.primary)
                    }
                }
            }
        }
    }
    
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteDetailView(note: "")
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
