//
//  ProfileView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct ProfileEditView: View {
    
    let baby: Baby
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var isShowingDialog = false
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var babyName: String
    @State private var babyDob: Date
    @State private var babyPhoto: UIImage?
    
    init(baby: Baby, babyName: String = "", babyDob: Date = Date()) {
        self.baby = baby
        _babyName = State(initialValue: baby.name ?? "Unknown")
        _babyDob = State(initialValue: baby.birthDate ?? Date())
        _babyPhoto = State(initialValue: (UIImage(data: baby.photo!)!))
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.primary.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    // MARK: Profile picture
                    Group {
                        if let photo = babyPhoto,
                           let uiImage = photo {
                            Image(uiImage: uiImage)
                                .resizable()
                        } else {
                            Image.ui.defaultPP
                                .resizable()
                        }
                    }
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    
                    Button {
                        shouldPresentActionScheet.toggle()
                    } label: {
                        Label("Ganti Foto", systemImage: "plus")
                    }
                    .buttonStyle(SmallGreenButtonStyle())
                    .padding([.top, .horizontal])
                    .padding(.bottom, 40)
                                        
                    // MARK: Name
                    VStack(alignment: .leading) {
                        Text("Nama")
                            .foregroundColor(Color.ui.text)
                        
                        TextField("Aruna Mazaya", text: $babyName)
                            .font(.headline)
                            .textFieldStyle(OvalTextFieldStyle())
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    
                    // MARK: DOB
                    VStack(alignment: .leading) {
                        Text("Tanggal Lahir")
                            .foregroundColor(Color.ui.text)
                        
                        Button {
                            isShowingDialog.toggle()
                        } label: {
                            Text("\(babyDob.dmYFormat())")
                                .frame(maxWidth: .infinity)
                                .animation(.linear, value: babyDob)
                        }
                        .buttonStyle(OvalWhiteButtonStyle())
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Batal") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem {
                        Button("Simpan") {
                            let editedBaby = baby
                            editedBaby.name = babyName
                            editedBaby.birthDate = babyDob
                            editedBaby.photo = babyPhoto?.pngData()
                            
                            PersistenceController.shared.save()
                            
                            dismiss()
                        }
                        .bold()
                    }
            }
            }
        }
        
        .sheet(isPresented: $shouldPresentImagePicker) {
            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$babyPhoto, isPresented: self.$shouldPresentImagePicker)
        }
        .sheet(isPresented: $isShowingDialog) {
            DatePicker("", selection: $babyDob, in: ...Date(), displayedComponents: [.date])
                .frame(width: 100)
                .datePickerStyle(.wheel)
                .presentationDetents([.height(250)])

        }
        .actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text("Pilih mode"), message: Text("Silakan pilih mode untuk mengatur foto profil"), buttons: [ActionSheet.Button.default(Text("Kamera"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = true
            }), ActionSheet.Button.default(Text("Galeri"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
        .onChange(of: babyPhoto) { newItem in
            Task {
                let dataImage = newItem
                babyPhoto = dataImage
            }
        }
    }
    
}
