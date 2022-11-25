//
//  NoteDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 24/11/22.
//

import SwiftUI

struct NoteDetailView: View {
    
    @State var title: String
    @State var note: String
    
    @FocusState private var titleOnFocus: Bool
    @FocusState private var noteOnFocus: Bool
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            BackgroundView()
                .ignoresSafeArea()
            
            ScrollView {
                if !titleOnFocus && !noteOnFocus {
                    MissionView(missionTitle: "Bisa menggerakkan kepala dari kiri/kanan ke tengah")
                }
               
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .padding()
                        .shadow(radius: 1)
                    
                    VStack {
                        TextField("", text: $title)
                            .focused($titleOnFocus)
                            .font(.title)
                            .bold()
                            .onSubmit {
                                titleOnFocus = false
                                noteOnFocus = true
                            }
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $note)
                                .focused($noteOnFocus)
                                .frame(minHeight: 100)
                        }
                        .padding(.horizontal, -4)
                    }
                    .padding(32)
                }
            }
            .alert(
                "Apakah Anda ingin menghapus catatan ini?",
                isPresented: $isPresented
            ) {
                Button("Hapus", role: .destructive) {
                    isPresented.toggle()
                }
                Button("Batal", role: .cancel) {
                    isPresented.toggle()
                }
            } message: {
                Text("Tindakan ini tidak bisa dibatalkan")
            }
            .animation(.spring(), value: titleOnFocus || noteOnFocus)
        }
        
        .navigationTitle("Catatan")
        .toolbar {
            ToolbarItem {
                if titleOnFocus || noteOnFocus {
                    Button {
                        titleOnFocus = false
                        noteOnFocus = false
                        
                        // Add save action below
                        
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
                            isPresented.toggle()
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
            NoteDetailView(title: "", note: "")
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
