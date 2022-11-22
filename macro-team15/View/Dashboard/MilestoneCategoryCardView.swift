//
//  MilestoneCategoryCardView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 23/11/22.
//

import SwiftUI

struct MilestoneCategoryCardView: View {
    
    let categoryTitle: String
    let missionTitle: String
    let primaryColor: Color
    let secondaryColor: Color
    let navigationLink: AnyView
    
    var body: some View {
        DisclosureGroup {
            VStack {
                Spacer()
                
                ForEach(0 ..< 5) { item in
                    NavigationLink {
                        navigationLink
                    } label: {
                        VStack {
                            Divider()
                            
                            HStack {
                                Button {
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundColor(primaryColor)
                                }
                                .padding(12)
                                
                                Text(missionTitle)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(primaryColor)
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
                    .foregroundColor(primaryColor)
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
                    
                    HStack {
                        ForEach(0 ..< 4) { item in
                            Capsule()
                                .frame(width: 32)
                                .foregroundColor(primaryColor)
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
        MilestoneCategoryCardView(categoryTitle: "Motorik", missionTitle: "Bisa mengangkat dagu sehingga berbalik ke posisi tengkurap", primaryColor: Color.ui.motorPrimary, secondaryColor: Color.ui.motorSecondary, navigationLink: AnyView(Text("Detail")))
    }
}
