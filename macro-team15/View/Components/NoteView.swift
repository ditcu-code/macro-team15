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

struct NoteViewV2: View {

    var milestone: Milestone
    var babyMilestone: BabyMilestone
    var babyNotes: BabyMilestoneNote
    
    @State private var refreshId = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink {
                NoteDetailViewV2(milestone: milestone, babyMilestone: babyMilestone, noteToEdit: babyNotes)
            } label: {
                VStack(alignment: .leading) {
                    HStack {
                        Text(babyNotes.title ?? "")
                            .font(.custom(FontType.semiBold.rawValue, fixedSize: 16))
                            .foregroundColor(Color.ui.secondary)
                            .frame(maxWidth: UIScreen.main.bounds.size.width - 140)
                            .lineLimit(nil)
                            .fixedSize()
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Image(systemName: babyNotes.isImportant ? "bookmark.fill" : "bookmark")
                            .foregroundColor(Color.ui.primary)
                            .font(.system(size: 22))
                        .bold()
                        .id(refreshId)
                        .padding()
                        .onTapGesture {
                            babyNotes.isImportant.toggle()
                            refreshId += 1
                            
                            PersistenceController.shared.save()
                        }
                    }
                    .padding(.bottom)
                    
                    HStack() {
                        Text(babyNotes.body ?? "")
                            .font(.custom(FontType.light.rawValue, fixedSize: 16))
                            .foregroundColor(Color.ui.text)
                            .frame(maxWidth: UIScreen.main.bounds.size.width - 150)
                            .lineLimit(nil)
                            .fixedSize()
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Text(babyNotes.modifiedDate!.shortdmYFormat())
                            .font(.custom(FontType.light.rawValue, fixedSize: 12))
                            .foregroundColor(Color.ui.text)
                            .padding(.trailing)
                    }
                }
                .padding([.bottom, .leading])
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
                )
                .padding(.horizontal)
                .padding(.bottom, 5)
            }
            
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.clear)
                .padding(.trailing, 20)
                .onTapGesture {
                    babyNotes.isImportant.toggle()
                    refreshId += 1
                    
                    PersistenceController.shared.save()
                }
        }
    }
}
