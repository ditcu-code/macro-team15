//
//  ProgressShareView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 27/11/22.
//

import SwiftUI

struct ProgressShareView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isPresented = false
    
    var body: some View {
        Button("Share") {
            isPresented.toggle()
        }
        
        .sheet(isPresented: $isPresented) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image.ui.placeholder
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.size.width, height: 350)
                    
                    HStack {
                        Spacer()
                        
                        Capsule()
                            .frame(width: 120, height: 6)
                            .padding(.top, 8)
                        
                        Spacer()
                    }
                    
                    Button {
                        isPresented.toggle()
                    } label: {
                        Label("Tutup", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                            .foregroundColor(Color.ui.secondary)
                            .font(.title)
                            .fontWeight(.black)
                            .padding()
                            .padding(.top, 10)
                    }
                }
                
                Group {
                    Text("Bagus sekali, Ceroy!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.ui.secondary)
                        .padding(.top, 28)
                    
                    Text("Kamu sudah bisa bermain kerincingan!")
                        .font(.title2)
                        .foregroundColor(Color.ui.secondary)
                        .padding(.vertical)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Label("Abadikan momen ini", systemImage: "camera")
                        }
                        .buttonStyle(PrimaryButtonStyle())

                        Button {
                            
                        } label: {
                            Label("Bagikan", systemImage: "square.and.arrow.up")
                                .labelStyle(.iconOnly)
                                .font(.title2)
                                .bold()
                        }
                        .foregroundColor(Color.ui.primary)
                        .padding(.horizontal)
                    }
                    .padding(.top, 60)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
//            .padding(.horizontal)
        }
    }
    
}

struct ProgressShareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressShareView()
    }
}
