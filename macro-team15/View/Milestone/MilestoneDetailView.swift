//
//  MilestoneDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 08/11/22.
//

import SwiftUI

struct MilestoneDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let notes = ["Abcalscjkdskvjdfknvdfjkvndfkjnv", "Def", "Ghi"]

    var body: some View {
        ZStack {
            Color.ui.background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                // Milestone card
                CardView(text: "Bisa mengangkat kepala mandiri hingga setinggi 45 derajat", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, isChecked: false, colorScheme: .dark)
                    .padding()
                
                // Important notes
                MilestoneDetailNotesView(sectionTitle: "Penting", notes: notes, navigationLink: nil)
                
                // Notes
                MilestoneDetailNotesView(sectionTitle: "Catatan", notes: notes, navigationLink: AnyView(ReportScreen()))
                
                // Stimulations body
                MilestoneDetailStimulationsView()
            }
        }
        
        .navigationTitle(Text("Milestone"))
    }
}

struct MilestoneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MilestoneDetailView()

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Back")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct MilestoneDetailNotesView: View {
    
    let sectionTitle: String
    let notes: [String]
    let navigationLink: AnyView?
    
    var body: some View {
        Group {
            // Important notes header
            SectionHeaderView(sectionTitle: sectionTitle, navigationLink: navigationLink)
            
            VStack {
                ForEach(notes, id: \.self) { note in
                    MilestoneDetailNoteCellView(title: note, subtitle: Date().dmYFormat())
                
                    if note != notes.last {
                        Divider()
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                }
            }
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
            )
            .padding([.bottom, .horizontal])
        }
    }
    
}

struct MilestoneDetailStimulationsView: View {
    
    var body: some View {
        Group {
            // Stimulations header
            SectionHeaderView(sectionTitle: "Stimulasi", navigationLink: nil)
            
            ScrollView(.horizontal) {
                VStack {
                    Image("PlaceholderImage")
                        .resizable()
                        .frame(width: 150, height: 175)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                    
                    Text("Tummy Time")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                )
                .padding(.leading)
            }
            .padding(.trailing)
        }
    }
    
}

struct MilestoneDetailNoteCellView: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.medium)
            
            Text(subtitle)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
}

struct SectionHeaderView: View {
    
    let sectionTitle: String
    let navigationLink: AnyView?
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            if let link = navigationLink {
                NavigationLink {
                    link
                } label: {
                    Text("Lihat semua")
                }
            }
        }
        .padding(.horizontal)
    }
    
}
