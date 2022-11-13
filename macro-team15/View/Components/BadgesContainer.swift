//
//  BadgesContainer.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 09/11/22.
//

import SwiftUI


struct BadgesContainer: View {
    var title: String
    var showSeeAll: Bool = false
//    var badges: [Badges] ///soon
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible ())]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                if(showSeeAll) {
                    NavigationLink(destination: BadgesScreen()) {
                        Text(
                            "Lihat Semua"
                        )
                    }
                }
                
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                let badgesCount: Int = showSeeAll ? 3 : 6
                ForEach(0 ..< badgesCount) { item in
                    
                    VStack {
                        Hexagon()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.ui.background)
                            .rotationEffect(Angle(degrees: 90))
                        
                        Text("Reward #\(item+1)")
                            .font(.subheadline)
                            .bold()
                        
                        Text(Date().dmYFormat())
                            .font(.subheadline)
                    }
                }
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 25)
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.ui.background, lineWidth: 4)
                .padding(.horizontal))
        }
    }
}


struct BadgesContainer_Previews: PreviewProvider {
    static var previews: some View {
        BadgesContainer(title: "General")
    }
}
