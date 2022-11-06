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
    
    var body: some View {
        VStack {
            MilestoneProgressHeaderView(title: title, age: age)
                .padding(.bottom)
            
            MilestoneProgressFullContentView()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
    
}

struct MilestoneProgressFullView_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneProgressFullView(title: "Milestone Progress", age: 23)
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
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                MilestoneProgressBarView(color: Color.ui.motorPrimary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.motorPrimary)
                MilestoneProgressCategoryView(category: "Motorik", color: Color.ui.motorPrimary)
            }
            .padding(.trailing, 12)
            
            VStack {
                MilestoneProgressBarView(color: Color.ui.cognitivePrimary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.cognitivePrimary)
                MilestoneProgressCategoryView(category: "Kognitif", color: Color.ui.cognitivePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressBarView(color: Color.ui.languagePrimary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.languagePrimary)
                MilestoneProgressCategoryView(category: "Bahasa", color: Color.ui.languagePrimary)
            }
            .padding(.horizontal, 12)
            
            VStack {
                MilestoneProgressBarView(color: Color.ui.socialPrimary)
                MilestoneProgressFinishedView(finished: 3, all: 4, color: Color.ui.socialPrimary)
                MilestoneProgressCategoryView(category: "Sosial & Emosional", color: Color.ui.socialPrimary)
            }
        }
    }
}

struct MilestoneProgressBarView: View {
    
    let color: Color
    
    var body: some View {
        Image(systemName: "lanyardcard.fill")
            .resizable()
            .frame(width: 25, height: 75)
            .foregroundColor(color)
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
