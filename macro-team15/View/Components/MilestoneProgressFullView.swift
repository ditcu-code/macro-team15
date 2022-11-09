//
//  MilestoneProgressFullView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 06/11/22.
//

import SwiftUI

struct MilestoneProgressFullView: View {
    
    let title: String
    let age: Int
    let withColor: Bool
    
    var body: some View {
        VStack {
            MilestoneProgressHeaderView(title: title, age: age)
                .padding(.bottom)
            
            MilestoneProgressFullContentView(withColor: withColor)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
    
}

struct MilestoneProgressFullView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneProgressFullView(title: "Milestone Progress", age: 23, withColor: true)
            .background(Color.yellow)
    }
}

struct MilestoneProgressHeaderView: View {
    
    let title: String?
    let age: Int
    
    var body: some View {
        HStack {
            Text(title ?? "Milestone Progress")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.ui.text)
            
            Spacer()
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("\(age) hari")
                    .foregroundColor(Color.ui.text)
            }
        }
        .padding(.bottom, 4)
    }
    
}

struct MilestoneProgressFullContentView: View {
    
    let withColor: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                MilestoneProgressBarView(finished: 3, all: 4, foregroundColor: !withColor ? Color.ui.disabledText : Color.ui.motorPrimary, backgroundColor: !withColor ? Color.ui.disabledText : Color.ui.motorSecondary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.motorPrimary)
                MilestoneProgressCategoryView(category: "Motorik", color: !withColor ? Color.ui.disabledText : Color.ui.motorPrimary)
            }
            .padding(.trailing, 12)
            
            VStack {
                MilestoneProgressBarView(finished: 3, all: 4, foregroundColor: !withColor ? Color.ui.disabledText : Color.ui.cognitivePrimary, backgroundColor: !withColor ? Color.ui.disabledText : Color.ui.cognitiveSecondary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.cognitivePrimary)
                MilestoneProgressCategoryView(category: "Kognitif", color: !withColor ? Color.ui.disabledText : Color.ui.cognitivePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressBarView(finished: 3, all: 4, foregroundColor: !withColor ? Color.ui.disabledText : Color.ui.languagePrimary, backgroundColor: !withColor ? Color.ui.disabledText : Color.ui.languageSecondary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.languagePrimary)
                MilestoneProgressCategoryView(category: "Bahasa", color: !withColor ? Color.ui.disabledText : Color.ui.languagePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressBarView(finished: 3, all: 4, foregroundColor: !withColor ? Color.ui.disabledText : Color.ui.socialPrimary, backgroundColor: !withColor ? Color.ui.disabledText : Color.ui.socialSecondary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: !withColor ? Color.ui.disabledText : Color.ui.socialPrimary)
                MilestoneProgressCategoryView(category: "Sosial & Emosional", color: !withColor ? Color.ui.disabledText : Color.ui.socialPrimary)
            }
        }
    }
    
}

struct MilestoneProgressBarView: View {
    
    let progressWidth: CGFloat = 20
    let progressHeight: CGFloat = 100
    
    let finished: CGFloat
    let all: CGFloat
    let foregroundColor: Color
    let backgroundColor: Color
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if finished / all < 1 {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
                    .frame(width: progressWidth, height: progressHeight)
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(foregroundColor)
                .frame(width: progressWidth, height: progressHeight * (finished/all))
        }
    }
    
}

struct MilestoneProgressFinishedView: View {
    
    let finished: Int
    let all: Int
    let color: Color
    
    var body: some View {
        Text("\(finished)/\(all)")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(color)
    }
    
}

struct MilestoneProgressCategoryView: View {
    
    let category: String
    let color: Color
    
    var body: some View {
        Text(category)
            .font(.subheadline)
            .foregroundColor(color)
    }
    
}
