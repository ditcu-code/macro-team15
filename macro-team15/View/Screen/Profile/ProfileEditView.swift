//
//  ProfileView.swift
//  macro-team15
//
//  Created by Darma Wiryanata on 02/12/22.
//

import SwiftUI

struct ProfileEditView: View {
    
    let baby: Baby
    @State private var image: UIImage? = UIImage(named: "TuntunHead")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var isShowingDialog = false
    
    @State private var babyName: String
    @State private var babyDob: Date
    
//    init(baby: Baby, image: UIImage? = nil, shouldPresentImagePicker: Bool = false, shouldPresentActionScheet: Bool = false, shouldPresentCamera: Bool = false, isShowingDialog: Bool = false, babyName: String, babyDob: Date) {
//        self.baby = baby
//        self.image = image
//        self.shouldPresentImagePicker = shouldPresentImagePicker
//        self.shouldPresentActionScheet = shouldPresentActionScheet
//        self.shouldPresentCamera = shouldPresentCamera
//        self.isShowingDialog = isShowingDialog
//
//        self.babyName = baby.name ?? "Unknown"
//        self.babyDob = baby.birthDate ?? Date()
//    }
    
    init(baby: Baby, babyName: String = "", babyDob: Date = Date()) {
        self.baby = baby
        _babyName = State(initialValue: baby.name ?? "Unknown")
        _babyDob = State(initialValue: baby.birthDate ?? Date())
    }

    var body: some View {
        NavigationView {
            VStack {
                // MARK: Profile picture
                Group {
                    if let photo = baby.photo,
                       let uiImage = UIImage(data: photo) {
                        Image(uiImage: uiImage)
                    } else {
                        Image.ui.defaultPP
                    }
                }
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
                        
                        PersistenceController.shared.save()
                        print("Baby updated")
                    }
                }
            }
        }
        .onAppear {
            print(baby)
        }
        
        .sheet(isPresented: $shouldPresentImagePicker) {
            SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
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
        .onChange(of: image) { newItem in
            Task {
                let dataImage = newItem?.pngData()
                baby.photo = dataImage
            }
        }
    }
    
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditView(viewModel: .constant(Baby(context: <#T##NSManagedObjectContext#>)))
//    }
//}
