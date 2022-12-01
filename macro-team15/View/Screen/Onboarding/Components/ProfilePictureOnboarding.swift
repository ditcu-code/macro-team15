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
    @State private var image: UIImage? = UIImage(named: "TuntunHead")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    
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
            
            Button("Abc") {
                shouldPresentActionScheet.toggle()
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
        .sheet(isPresented: $shouldPresentImagePicker) {
            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
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
        .onChange(of: image) { newItem in
            Task {
                let dataImage = newItem?.pngData()
                viewModel.photo = dataImage
            }
        }
    }
    
}
