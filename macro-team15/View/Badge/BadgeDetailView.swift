//
//  BadgeDetailView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 09/11/22.
//

import SwiftUI

struct BadgeDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    let subtitle: String
    let acquiredDate: Date
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.background
                    .ignoresSafeArea()
                
                VStack {
                    Hexagon()
                        .frame(width: 300, height: 300)
                        .foregroundColor(Color.ui.background)
                        .padding(.leading, 4)
                        .rotationEffect(Angle(degrees: 90))
                    
                    VStack {
                        Text(title)
                            .font(.title)
                        
                        Text(subtitle)
                            .font(.callout)
                    }
                    .padding(.top)
                    
                    Text("Didapatkan pada \(acquiredDate.dmYFormat())")
                        .font(.callout)
                        .padding(.top)
                    
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height / 6)
                }
            }
            
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Tutup")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

struct BadgeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeDetailView(title: "Reward #1", subtitle: "Keterangan reward", acquiredDate: Date())
    }
}
