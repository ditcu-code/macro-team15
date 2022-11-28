//
//  OnboardingView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 23/11/22.
//

import SwiftUI
import PhotosUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .top) {
                HStack {
                    if viewModel.step > 1 {
                        Button {
                            viewModel.prevStep()
                        } label: {
                            Label("Kembali", systemImage: "chevron.left").labelStyle(.titleAndIcon)
                        }
                    }
                    Spacer()
                    if viewModel.step == 3 {
                        Button("Lewati") {
                            viewModel.step = 4
                        }
                    }
                }
                .foregroundColor(Color.ui.primary)
                .padding()
            }.zIndex(1)
            
            ZStack(alignment: .bottom) {
                Color.green.opacity(0.1).ignoresSafeArea()
                
                VStack {
                    if (viewModel.step != 3) {
                        TuntunIllustration(step: $viewModel.step)
                            .padding(.bottom, 30)
                    }
                    switch viewModel.step {
                    case 0:
                        GreetingOnboarding(viewModel: viewModel)
                        
                    case 1:
                        NameOnboarding(viewModel: viewModel)
                        
                    case 2:
                        DateOnboarding(viewModel: viewModel)
                        
                    case 3:
                        ProfilePictureOnboarding(viewModel: viewModel)
                        
                    default:
                        GreetingOnboarding(viewModel: viewModel)
                    }
                }
                .padding()
                .offset(y: -UIScreen.main.bounds.height / 5)
                
            }.animation(.default, value: viewModel.step)
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
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
            viewModel.saveBaby()
            UserDefaults.standard.set(true, forKey: "isDoneOnboarding")
        }.buttonStyle(PrimaryButtonStyle())
        
    }
}

struct DateOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var isShowingDialog = false
    
    var body: some View {
        Group {
            
            HStack {
                OnboardingText(text: "Kapan \(viewModel.name) hadir dan mewarnai hari-hari Ayah Bunda?").padding(.bottom, 5)
                Spacer()
            }
            Button {
                isShowingDialog.toggle()
            } label: {
                Text("\(viewModel.birthDate.dmYFormat())")
                    .frame(maxWidth: .infinity)
                    .animation(.linear, value: viewModel.birthDate)
            }
            .buttonStyle(OvalWhiteButtonStyle())
            .padding(.bottom)
        }.offset(x: viewModel.step == 2 ? 0 : -UIScreen.main.bounds.height)
        
        Button("Selanjutnya") {
            viewModel.nextStep()
        }
        .disabled(Calendar.current.isDateInToday(viewModel.birthDate))
        .buttonStyle(PrimaryButtonStyle())
        .sheet(isPresented: $isShowingDialog) {
            DatePicker("", selection: $viewModel.birthDate, in: ...Date(), displayedComponents: [.date])
                .frame(width: 100)
                .datePickerStyle(.wheel)
                .presentationDetents([.height(250)])
            
        }
    }
}


struct NameOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Group {
            HStack {
                OnboardingText(text: "Yuk, isi nama bayi yang akan Tuntun temani perjalanannya").padding(.bottom, 5)
                Spacer()
            }
            TextField("Aruna Mazaya", text: $viewModel.name)
                .font(.headline)
                .textFieldStyle(OvalTextFieldStyle())
                .padding(.bottom)
        }
        Button("Selanjutnya") {
            viewModel.nextStep()
        }
        .buttonStyle(PrimaryButtonStyle())
        .disabled(viewModel.name.count < 1)
    }
}

struct GreetingOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack {
            OnboardingText(text: "Hi Ayah Bunda!\nAku Tuntun, yang akan menemani perjalanan Ayah Bunda dan bayi di 1000 hari pertamanya!").offset(x: viewModel.step == 0 ? 0 : -UIScreen.main.bounds.height)
        }.padding(.bottom, 5)
        Button("Selanjutnya") {
            viewModel.nextStep()
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
