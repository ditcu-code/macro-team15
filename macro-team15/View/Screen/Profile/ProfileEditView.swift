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
                    Label(baby.photo != nil ? "Ganti Foto" : "Tambah Foto", systemImage: "plus")
                }
                .buttonStyle(SmallGreenButtonStyle())
                .padding()
                
                // MARK: Name
                TextField("Aruna Mazaya", text: $babyName)
                    .font(.headline)
                    .textFieldStyle(OvalTextFieldStyle())
                    .padding(.bottom)
                
                // MARK: DOB
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
            
            .toolbar {
                ToolbarItem {
                    Button("Simpan") {
                        let editedBaby = baby
                        editedBaby.name = babyName
                        editedBaby.birthDate = babyDob
                        editedBaby.photo = babyPhoto?.pngData()
                        
                        PersistenceController.shared.save()
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
            ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = true
            }), ActionSheet.Button.default(Text("Photo Library"), action: {
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
