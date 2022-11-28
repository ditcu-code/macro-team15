//
//  ProfilePictureOnboarding.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI
import PhotosUI

struct ProfilePictureOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Group {
                if let photo = viewModel.photo,
                   let uiImage = UIImage(data: photo) {
                    Image(uiImage: uiImage)
                } else {
                    Image.ui.defaultPP
                }
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            
            Button {
                
            } label: {
                PhotosPicker(
                    selection: $viewModel.selectedPicture,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text(
                        viewModel.photo != nil ?
                        "+ ganti foto" : "+ tambah foto"
                    )
                    .frame(minWidth: 90)
                    .animation(.linear, value: viewModel.photo)
                }.onChange(of: viewModel.selectedPicture) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            viewModel.photo = data
                        }
                    }
                }
            }
            .buttonStyle(SmallGreenButtonStyle())
            .padding()
            
        }
        HStack {
            OnboardingText(text: "Wah, Tuntun jadi penasaran \(viewModel.name) seperti apa?").padding(.bottom, 5)
            Spacer()
        }
        
        Button("Selesai") {
            viewModel.finalStep()
        }
        .buttonStyle(PrimaryButtonStyle())
        .disabled(viewModel.photo == nil)
        
    }
}

struct SmallGreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.subheadline.bold())
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .frame(minWidth: 125)
            .background(Color.ui.primary)
            .cornerRadius(16)
            .shadow(
                color: .gray.opacity(0.5),
                radius: 2, x: 0, y: 1
            )
    }
}
