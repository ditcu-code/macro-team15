//
//  ProgressShareView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 27/11/22.
//

import SwiftUI

struct ProgressShareView: View {
    
    @Binding var isPresented: Bool
    
    @State var image: UIImage? = nil
    @State var items: [Any] = []
    @State var sheet = false
        
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                snapshot
                
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
                        items.removeAll()
                        
                        let image = snapshot.asImage
                        items.append("Ayo download Panda")
                        items.append(image)
                        
                        sheet.toggle()
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
        
        .sheet(isPresented: $sheet) {
            ShareSheet(items: items)
        }
    }
    
    var snapshot: some View {
        Image.ui.placeholder
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width, height: 350)
    }
    
}

struct ProgressShareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressShareView(isPresented: .constant(false))
    }
}

// MARK: Share sheet
struct ShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
    
}
