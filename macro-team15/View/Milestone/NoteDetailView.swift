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
        VStack {
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
        .background(BackgroundView())
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


struct NoteDetailViewV2: View {
    
    var milestone: Milestone
    var babyMilestone: BabyMilestone
    var noteToEdit: BabyMilestoneNote?
        
    @State private var title: String
    @State private var bodyNote: String
    @State private var isImportant: Bool
    
    @FocusState private var titleOnFocus: Bool
    @FocusState private var noteOnFocus: Bool
    
    @State private var isPresented = false
    
    init(milestone: Milestone, babyMilestone: BabyMilestone, noteToEdit: BabyMilestoneNote? = nil, title: String = "", note: String = "", isImportant: Bool = false, titleOnFocus: Bool = false, noteOnFocus: Bool  = false, isPresented: Bool = false) {
        self.milestone = milestone
        self.babyMilestone = babyMilestone
        self.noteToEdit = noteToEdit
        if let note = noteToEdit {
            _title = State(initialValue: note.title!)
            _bodyNote = State(initialValue: note.body!)
        } else {
            self.title = title
            self.bodyNote = note
        }
        self.isImportant = isImportant
        self.titleOnFocus = titleOnFocus
        self.noteOnFocus = noteOnFocus
        self.isPresented = isPresented
    }
    
    var body: some View {
        VStack {
            if !titleOnFocus && !noteOnFocus {
                MissionView(missionTitle: milestone.title)
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
                        TextEditor(text: $bodyNote)
                            .focused($noteOnFocus)
                            .frame(minHeight: 100)
                    }
                    .padding(.horizontal, -4)
                }
                .padding(32)
            }
        }
        .background(BackgroundView())
        .alert(
            "Apakah Anda ingin menghapus catatan ini?",
            isPresented: $isPresented
        ) {
            Button("Hapus", role: .destructive) {
                deleteNote()
                
                isPresented.toggle()
            }
            Button("Batal", role: .cancel) {
                isPresented.toggle()
            }
        } message: {
            Text("Tindakan ini tidak bisa dibatalkan")
        }
        .animation(.spring(), value: titleOnFocus || noteOnFocus)
        
        .navigationTitle("Catatan")
        .toolbar {
            ToolbarItem {
                if titleOnFocus || noteOnFocus {
                    Button {
                        titleOnFocus = false
                        noteOnFocus = false
                        
                        // Add save action below
                        if let note = noteToEdit {
                            note.title = title
                            note.body = bodyNote
                            note.isImportant = isImportant
                            note.modifiedDate = Date()
                        } else {
                            let babyNote = BabyMilestoneNote(context: PersistenceController.viewContext)
                            babyNote.id = UUID()
                            babyNote.title = title
                            babyNote.body = bodyNote
                            babyNote.isImportant = isImportant
                            babyNote.modifiedDate = Date()
                            babyNote.milestone = babyMilestone
                        }

                        PersistenceController.shared.save()
                        
                    } label: {
                        Text("Done")
                            .foregroundColor(Color.ui.primary)
                    }
                } else {
                    if noteToEdit != nil {
                        Menu {
                            Button {
                                isImportant.toggle()
                            } label: {
                                Label("Penting", systemImage: isImportant ? "bookmark.fill" : "bookmark")
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
                    } else {
                        Button {
                            isImportant.toggle()
                        } label: {
                            Label("Penting", systemImage: isImportant ? "bookmark.fill" : "bookmark")
                                .labelStyle(.iconOnly)
                        }

                    }
                }
            }
        }
    }
    
    func deleteNote() {
        if let note = noteToEdit {
            PersistenceController.viewContext.delete(note)
            
            PersistenceController.shared.save()
        }
    }
    
}
