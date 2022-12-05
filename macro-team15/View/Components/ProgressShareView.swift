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
    @State var shareable: Photo? = nil
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var photo: UIImage? = UIImage(named: "milestoneIcon")
    
    let title: String
    let category: String
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
        
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
                        shouldPresentImagePicker.toggle()
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
            render()
            shareable = Photo(image: Image(uiImage: image!), caption: "Ayo download Tuntun")
        }
        .onChange(of: photo) { item in
            render()
            shareable = Photo(image: Image(uiImage: image!), caption: "Ayo download Tuntun")
        }
        .sheet(isPresented: $shouldPresentImagePicker) {
            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$photo, isPresented: self.$shouldPresentImagePicker)
        }
        .actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = true
            }), ActionSheet.Button.default(Text("Photo Library"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
    }
    
    var snapshot: some View {
            ZStack {
                Color.ui.primary.opacity(0.1)
                
                HStack {
                    Image.ui.tuntunIconEye
                        .resizable()
                        .frame(width: 230/6, height: 137/6)

                    Text("tun")
                        .font(.custom(FontType.semiBold.rawValue, size: 14, relativeTo: .body))

                    Text("tun")
                        .font(.custom(FontType.semiBold.rawValue, size: 14, relativeTo: .body))
                        .foregroundColor(Color.ui.primary)
                        .padding(.leading, -8)

                    Spacer()
                }
                .position(x: screenWidth * 0.55, y: screenHeight * 0.04)
                
                Image.ui.placeholder
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth - 120, height: screenWidth - 120)
                    .clipped()
                    .offset(CGSize(width: 0, height: -(screenHeight) * 0.04))
                
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: screenWidth * 0.08, height: screenWidth * 0.08)
                    .foregroundColor(Color.ui.motorPrimary)
                    .background {
                        Circle()
                            .foregroundColor(.white)
                            .padding(-(screenWidth) * 0.02)
                    }
                    .position(x: screenWidth * 0.57, y: screenHeight * 0.08)
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: screenWidth * 0.09, height: screenWidth * 0.08)
                    .foregroundColor(Color.ui.socialPrimary)
                    .background {
                        Circle()
                            .foregroundColor(.white)
                            .padding(-(screenWidth) * 0.02)
                    }
                    .position(x: screenWidth * 0.14, y: screenHeight * 0.27)
                
                Image.ui.tuntunHead
                    .resizable()
                    .frame(width: screenWidth * 0.3, height: screenWidth * 0.3)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .rotationEffect(.degrees(10))
                    .foregroundColor(Color.ui.socialPrimary)
                    .position(x: screenWidth * 0.8, y: screenHeight * 0.1)
                
                Image(systemName: "character.bubble.fill")
                    .resizable()
                    .frame(width: screenWidth * 0.09, height: screenWidth * 0.08)
                    .foregroundColor(Color.ui.languagePrimary)
                    .background {
                        Circle()
                            .foregroundColor(.white)
                            .padding(-12)
                    }
                    .position(x: screenWidth * 0.85, y: screenHeight * 0.23)
                
                Image(systemName: "puzzlepiece.fill")
                    .resizable()
                    .frame(width: screenWidth * 0.12, height: screenWidth * 0.08)
                    .foregroundColor(Color.ui.cognitivePrimary)
                    .background {
                        Circle()
                            .foregroundColor(.white)
                            .padding(-12)
                    }
                    .position(x: screenWidth * 0.85, y: screenHeight * 0.41)
                
                Text("Berbicara dengan nada seolah berbicara dengan bahasa yang benar tapa menggunakan kata yang bisa dimengerti")
                    .font(.custom(FontType.semiBold.rawValue, size: 18))
                    .foregroundColor(Color.ui.primary)
                    .frame(maxWidth: screenWidth * 0.8)
                    .position(x: screenWidth * 0.45, y: screenHeight * 0.48)
                
    //            VStack {
    //
    //
    //                Spacer()
    //
    //                Image.ui.placeholder
    //                    .resizable()
    //                    .scaledToFill()
    //                    .frame(width: UIScreen.main.bounds.width - 100, height: 200)
    //                    .clipped()
    //                    .padding(.bottom, 10)
    //
    //                Text("Membalikan badan dari telentang ke tengkurap")
    //                    .font(.caption)
    //                    .bold()
    //                    .foregroundColor(Color.ui.primary)
    //                    .multilineTextAlignment(.center)
    //                    .padding(.bottom, 4)
    //
    //                Text("12 September 2020")
    //                    .font(.caption2)
    //
    //                Spacer()
    //            }
    //            .padding(.leading, -4)
    //            .padding(.bottom, 4)
            }
            .frame(width: screenWidth, height: screenWidth * 1.25)
    }
    
    @MainActor func render() {
        let renderer = ImageRenderer(content: snapshot)

        renderer.scale = 2.5

        if let uiImage = renderer.uiImage {
            image = uiImage
        }
    }
    
}

struct ProgressShareView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressShareView(title: "Title", category: "Category")
    }
}
