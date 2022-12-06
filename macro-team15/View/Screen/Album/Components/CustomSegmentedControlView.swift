//
//  CustomSegmentedControlView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 28/11/22.
//

import SwiftUI

struct CustomSegmentedControlView: View {
    
    let selections = ["Milestone", "Aktivitas"]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ForEach(selections.indices, id: \.self) { index in
            Text(selections[index])
                .frame(maxWidth: .infinity)
                .bold()
                .foregroundColor(index == selectedTab ? .white : Color.ui.text)
                .padding(.vertical, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(index == selectedTab ? Color.ui.primary : Color.ui.segmentedControlBackground)
                }
                .onTapGesture {
                    withAnimation(Animation.interactiveSpring(response: 0.2, dampingFraction: 2, blendDuration: 0.5)) {
                        selectedTab = index
                    }
                }
        }
    }
    
}

struct CustomSegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedControlView(selectedTab: .constant(0))
    }
}
