//
//  StimulusDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 26/11/22.
//

import SwiftUI

struct StimulusDetailView: View {
    let stimulus: Stimulus
    let allStimulus: [Stimulus]
    
    @ObservedObject var vm = StimulusDetailViewModel()
    @State private var showShareSheet = false

    init(stimulus: Stimulus, allStimulus: [Stimulus], vm: StimulusDetailViewModel = StimulusDetailViewModel()) {
        self.stimulus = stimulus
        self.allStimulus = allStimulus
        self.vm = vm
        self.vm.getMaterial(stimulus: stimulus)
    }
    
    var body: some View {
        ScrollView {
            HighlightedStimulusView(withCTA: false, stimulus: stimulus, allStimulus: allStimulus)
            
            Divider()
                .padding(.top)
                .padding(.bottom, 8)
            
            if let materials = vm.materials, materials.count > 0 {
                ContentHeaderView(title: "Material", subtitle: "Peralatan untuk mendukung aktivitas ini", navigationLink: nil)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(materials, id: \.self) { item in
                                StimulusMaterialView(material: item)
                        }
                    }
                }
                
                Divider()
                    .padding(.bottom, 12)
            }
            
            
            ContentHeaderView(title: "Langkah-langkah", subtitle: "Panduan untuk aktivitas ini", navigationLink: nil)
            
            
            ForEach(Array(stimulus.activities.enumerated()), id: \.offset) { index, element in
                StimulusStepView(order: index + 1, description: element)
            }
            
            Button {
                showShareSheet.toggle()
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
                        
                        ForEach(allStimulus) { item in
                            ActivityCardViewV2(stimulus: item, allStimulus: allStimulus.filter({$0 != item}))
                        }
                    }
                }
            }
        }
        .background {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $showShareSheet) {
            ProgressShareView(title: stimulus.activityName)
                .presentationDetents([.height(600)])
        }
        
        .navigationTitle(Text("Detail Aktivitas"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    showShareSheet.toggle()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.ui.primary)
                }
            }
        }
    }
}
//
//struct StimulusDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            StimulusDetailView(stimulus: StimulusData.getAll()[2])
//        }
//    }
//}
