//
//  StimulusDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusDetailView: View {
    var body: some View {
            ScrollView {
                HighlightedStimulusView(withCTA: false)

                Divider()
                    .padding(.top)
                    .padding(.bottom, 8)

                ContentHeaderView(title: "Material", subtitle: "Peralatan untuk mendukung aktivitas ini", navigationLink: nil)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .padding(.leading, 10)

                        ForEach(0 ..< 5) { item in
                            StimulusMaterialView()
                                .padding(.trailing, 10)
                        }
                    }
                }
                .padding(.top)

                Divider()
                    .padding(.top)
                    .padding(.bottom, 12)

                ContentHeaderView(title: "Langkah-langkah", subtitle: "Panduan untuk aktivitas ini", navigationLink: nil)
                
                ForEach(1 ..< 5) { item in
                    StimulusStepView(order: item, description: "Lakukan Tummy Time di tempat yang datar seperti lantai, kasur, atau di atas perut dan pangkuan bunda")
                }

                Button {

                } label: {
                    Label("Abadikan momen", systemImage: "camera")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding()

                Divider()

                Group {
                    ContentHeaderView(title: "Aktivitas lainnya", subtitle: "Kegiatan untuk mendukung milestone lainnya", navigationLink: nil)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Spacer()
                                .padding(.leading, 8)

                            ForEach(0 ..< 5) { item in
                                ActivityCardView(title: "Tummy Time", subtitle: "Aktivitas ini dapat mendukung pencapaian motorik dan kognitif!", navigationLink: AnyView(Text("Detail")))
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
        .background {
            BackgroundView()
        }
        .navigationTitle(Text("Detail Aktivitas"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.ui.primary)
                }
            }
        }
    }
}

struct StimulusDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StimulusDetailView()
        }
    }
}
