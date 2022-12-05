//
//  ProgressShareView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 27/11/22.
//

import SwiftUI

struct ProgressShareView: View {
    
    @Environment (\.dismiss) private var dismiss
    
    @State var image: UIImage? = nil
    @State var items: [Any] = []
    @State var sheet = false
    @State var shareable: Photo? = nil
    
    let title: String
    let category: String
        
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
                    dismiss()
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
                    
                    if let share = shareable {
                        ShareLink(
                            item: share,
                            preview: SharePreview(
                                share.caption,
                                image: share.image
                            )
                        ) {
                            Label("Bagikan", systemImage: "square.and.arrow.up")
                                .labelStyle(.iconOnly)
                                .font(.title2)
                                .bold()
                        }
                        .foregroundColor(Color.ui.primary)
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 60)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .onAppear {
            let image = snapshot.asImage
            shareable = Photo(image: Image(uiImage: image), caption: "Ayo download Tuntun")
        }
        
        .sheet(isPresented: $sheet) {
            ShareSheet(items: items)
        }
    }
    
    var snapshot: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                Spacer()
                
                Image.ui.placeholder
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .clipped()
                    .padding(.bottom, 10)
                
                Text("Membalikan badan dari telentang ke tengkurap")
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color.ui.primary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 4)
                
                Text("12 September 2020")
                    .font(.caption2)
                
                Spacer()
            }
            
            HStack {
                Image.ui.tuntunIconEye
                    .resizable()
                    .frame(width: 230/6, height: 137/6)
                
                Text("tuntun")
                    .font(.custom(FontType.semiBold.rawValue, size: 14, relativeTo: .body))
            }
            .padding(.leading, -4)
            .padding(.bottom, 4)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        .background {
            Image("BackgroundFill1Image")
                .resizable()
        }
    }
    
}

struct ProgressShareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressShareView(title: "Title", category: "Category")
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
