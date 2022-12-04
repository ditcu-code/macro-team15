//
//  NotesView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 04/12/22.
//

import SwiftUI

struct NotesView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: BabyMilestoneNote.entity(), sortDescriptors: [])
    private var notes: FetchedResults<BabyMilestoneNote>
    
    var body: some View {
        ScrollView {
            Spacer()
                .padding(.top)

            ForEach(notes) { note in
                NoteViewV2(milestone: MilestoneData.getAll().filter({ $0.id == note.milestone?.milestoneID ?? 1 }).first!, babyMilestone: note.milestone!, babyNotes: note)
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
        .environment(\.managedObjectContext, PersistenceController.notesPreview.container.viewContext)
    }
}
