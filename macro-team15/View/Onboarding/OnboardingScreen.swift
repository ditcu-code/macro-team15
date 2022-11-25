//
//  OnboardingScreen.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 23/11/22.
//

import SwiftUI
import PhotosUI

struct OnboardingScreen: View {
    @State var step: Int = 0
    @State var name: String = ""
    @State var date: Date = Date()
    @State var selectedPicture: PhotosPickerItem? = nil
    @State var selectedPictData: Data? = nil
    
    var body: some View {
        
        ZStack(alignment: .top) {
            ZStack(alignment: .top) {
                HStack {
                    if step > 1 {
                        Button {
                            step -= 1
                        } label: {
                            Label("Kembali", systemImage: "chevron.left").labelStyle(.titleAndIcon)
                        }
                    }
                    Spacer()
                    if step == 3 {
                        Button("Lewati") {
                            step = 4
                        }
                    }
                }
                .foregroundColor(Color.ui.primary)
                .padding()
            }.zIndex(1)
            ZStack(alignment: .bottom) {
                Color.green.opacity(0.1).ignoresSafeArea()
                VStack {
                    if (step != 3) {
                        TuntunIllustration(step: $step)
                            .padding(.bottom, 30)
                    }
                    switch step {
                    case 0:
                        GreetingOnboarding(step: $step)
                        
                    case 1:
                        NameOnboarding(name: $name, step: $step)
                        
                    case 2:
                        DateOnboarding(name: $name, date: $date, step: $step)
                        
                    case 3:
                        ProfilePictureOnboarding(name: $name, step: $step, selectedPicture: $selectedPicture, selectedPictData: $selectedPictData)
                        
                    default:
                        GreetingOnboarding(step: $step)
                    }
                }
                .padding()
                .offset(y: -UIScreen.main.bounds.height / 5)
                
            }.animation(.default, value: step)
        }
        
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(
                color: .gray.opacity(0.5),
                radius: 2, x: 0, y: 1
            )
            .multilineTextAlignment(.center)
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

struct OvalWhiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
    }
}

struct ProfilePictureOnboarding: View {
    @Binding var name: String
    @Binding var step: Int
    @Binding var selectedPicture: PhotosPickerItem?
    @Binding var selectedPictData: Data?
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            Group {
                if let selectedPictData,
                   let uiImage = UIImage(data: selectedPictData) {
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
                    selection: $selectedPicture,
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text(
                        selectedPictData != nil ?
                        "+ ganti foto" : "+ tambah foto"
                    )
                    .frame(minWidth: 90)
                    .animation(.linear, value: selectedPictData)
                }.onChange(of: selectedPicture) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPictData = data
                        }
                    }
                }
            }
            .buttonStyle(SmallGreenButtonStyle())
            .padding()
            
        }
        HStack {
            OnboardingText(text: "Wah, Tuntun jadi penasaran \(name) seperti apa?").padding(.bottom, 5)
            Spacer()
        }
        Button("Selesai") {
//            let newBaby = Baby(context: moc)
            
        }.buttonStyle(PrimaryButtonStyle())
    }
}

struct DateOnboarding: View {
    @Binding var name: String
    @Binding var date: Date
    @Binding var step: Int
    @State private var isShowingDialog = false
    
    var body: some View {
        Group {
            
            HStack {
                OnboardingText(text: "Kapan \(name) hadir dan mewarnai hari-hari Ayah Bunda?").padding(.bottom, 5)
                Spacer()
            }
            Button {
                isShowingDialog.toggle()
            } label: {
                Text("\(date.dmYFormat())")
                    .frame(maxWidth: .infinity)
                    .animation(.linear, value: date)
            }
            .buttonStyle(OvalWhiteButtonStyle())
            .padding(.bottom)
        }.offset(x: step == 2 ? 0 : -UIScreen.main.bounds.height)
        
        Button("Selanjutnya") {
            step == 2 ? step += 1 : nil
        }
        .disabled(Calendar.current.isDateInToday(date))
        .buttonStyle(PrimaryButtonStyle())
        .sheet(isPresented: $isShowingDialog) {
            DatePicker("", selection: $date, in: ...Date(), displayedComponents: [.date])
                .frame(width: 100)
                .datePickerStyle(.wheel)
                .presentationDetents([.height(250)])
            
        }
    }
}


struct NameOnboarding: View {
    @Binding var name: String
    @Binding var step: Int
    
    var body: some View {
        Group {
            HStack {
                OnboardingText(text: "Yuk, isi nama bayi yang akan Tuntun temani perjalanannya").padding(.bottom, 5)
                Spacer()
            }
            TextField("Aruna Mazaya", text: $name)
                .font(.headline)
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.bottom)
        }.offset(x: step == 1 ? 0 : -UIScreen.main.bounds.height)
        Button("Selanjutnya") {
            step == 1 ? step += 1 : nil
        }
        .buttonStyle(PrimaryButtonStyle())
        .disabled(name.count < 1)
    }
}

struct GreetingOnboarding: View {
    @Binding var step: Int
    
    
    var body: some View {
        HStack {
            OnboardingText(text: "Hi Ayah Bunda!\nAku Tuntun, yang akan menemani perjalanan Ayah Bunda dan bayi di 1000 hari pertamanya!").offset(x: step == 0 ? 0 : -UIScreen.main.bounds.height)
        }.padding(.bottom, 5)
        Button("Selanjutnya") {
            step == 0 ? step += 1 : nil
        }.buttonStyle(PrimaryButtonStyle())
        
    }
}

struct OnboardingText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Alexandria-SemiBold", size: 19))
            .foregroundColor(Color.ui.secondary)
            .bold()
            .padding(10)
    }
}

struct TuntunIllustration: View {
    @Binding var step: Int
    @State private var degree: Double = 0.0
    @State private var horizontal: Double = 30.0
    
    var body: some View {
        HStack {
            Group {
                Image.ui.tuntunHead.padding(.leading)
                Image
                    .ui
                    .tuntunHand
                    .rotationEffect(.degrees(degree), anchor: .bottomLeading)
                    .onAppear {
                        if step == 0 {
                            withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                                degree = 30
                            }
                            withAnimation(.linear) {
                                horizontal = 0
                            }
                        }
                    }
            }
        }.offset(y: step == 0 ? horizontal : 0)
    }
}
