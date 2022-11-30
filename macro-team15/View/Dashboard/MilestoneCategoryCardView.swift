//
//  MilestoneCategoryCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 23/11/22.
//

import SwiftUI

struct MilestoneCategoryCardView: View {
    
    let categoryTitle: String
    let color: Color
    let currentProgress: Int
    let allProgress: Int
    
    var body: some View {
        DisclosureGroup {
            VStack {
                Spacer()
                
                ForEach(0 ..< 5) { item in
                    NavigationLink {
                        MilestoneDetailView()
                    } label: {
                        VStack {
                            Divider()
                            
                            HStack {
                                Button {
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(color)
                                }
                                .padding(12)
                                
                                Text("Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap")
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(color)
                            }
                        }
                    }
                }
            }
            
        } label: {
            HStack {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(color)
                    .padding(12)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(categoryTitle)")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("(1/5)")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    ZStack(alignment: .leading) {
                        HStack {
                            ForEach(0 ..< allProgress) { item in
                                Capsule()
                                    .frame(width: 32)
                                    .foregroundColor(color.opacity(0.3))
                            }
                        }
                        
                        HStack {
                            ForEach(0 ..< currentProgress) { item in
                                Capsule()
                                    .frame(width: 32)
                                    .foregroundColor(color)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .foregroundColor(Color.ui.text)
        .padding()
    }
}

struct MilestoneCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneCategoryCardView(categoryTitle: "Motorik", color: Color.ui.motorPrimary, currentProgress: 2, allProgress: 4)
    }
}
