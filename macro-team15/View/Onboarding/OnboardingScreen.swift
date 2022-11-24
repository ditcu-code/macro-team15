//
//  OnboardingScreen.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 23/11/22.
//

import SwiftUI

struct OnboardingScreen: View {
    @State var step: Int = 0
    @State var name: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.green.opacity(0.1)
//                switch step {
//                case 0:
//                    GreetingOnboarding(step: $step)
//
//                case 1:
//                    NameOnboarding(name: $name, step: $step)
//
//                case 2:
//                    DateOnboarding(name: $name, date: $date, step: $step)
//
//                case 3:
//                    ProfilePictureOnboarding(name: $name, step: $step)
//
//
//                default:
//                    GreetingOnboarding(step: $step)
//                }
                ProfilePictureOnboarding(name: $name, step: $step)
                
            }.animation(.linear, value: step)
        }.navigationTitle("Profil Anak")
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
            .padding(15)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
    }
}

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color.UI().primary)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
    }
}

struct OvalWhiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(15)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
    }
}

struct ProfilePictureOnboarding: View {
    @Binding var name: String
    @Binding var step: Int
    
    var body: some View {
        VStack {
            
            VStack {
                Image("DefaultProfilePicture").clipShape(Circle())
                Button("+ tambah foto") {
                    
                }.buttonStyle(GreenButtonStyle()).offset(y: -20)
            }

            Text("Wah, Tuntun jadi penasaran Ceroy seperti apa?")
                .font(.title2)
                .bold()
                .padding()
            HStack {
                TextField("Aruna Mazaya", text: $name).font(.headline).padding()
            }
            .textFieldStyle(OvalTextFieldStyle())
            Button("Selanjutnya") {
                step == 3 ? step += 1 : nil
            }.disabled(name.count < 1)
        }.padding()
    }
}

struct DateOnboarding: View {
    @Binding var name: String
    @Binding var date: Date
    @Binding var step: Int
    @State private var isShowingDialog = false
    
    var body: some View {
        VStack {
            Text("Kapan \(name) hadir dan mewarnai hari-hari\nAyah Bunda?")
                .font(.title2)
                .bold()
                .padding()
            
            Button {
                isShowingDialog.toggle()
            } label: {
                Text("\(date.dmYFormat())")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(OvalWhiteButtonStyle())
            
            Button("Selanjutnya") {
                step == 2 ? step += 1 : nil
            }
            .disabled(date == Date())
            .sheet(isPresented: $isShowingDialog) {
                DatePicker("", selection: $date, displayedComponents: [.date])
                    .frame(width: 100)
                    .datePickerStyle(.wheel)
                    .presentationDetents([.height(250)])
            }
        }.padding()
    }
}


struct NameOnboarding: View {
    @Binding var name: String
    @Binding var step: Int
    
    var body: some View {
        VStack {
            Text("Tuntun mau kenalan nih sama sang buah hati,\nsiapa namanya?")
                .font(.title2)
                .bold()
                .padding()
            HStack {
                TextField("Aruna Mazaya", text: $name).font(.headline).padding()
            }
            .textFieldStyle(OvalTextFieldStyle())
            Button("Selanjutnya") {
                step == 1 ? step += 1 : nil
            }.disabled(name.count < 1)
        }.padding()
    }
}

struct GreetingOnboarding: View {
    @Binding var step: Int
    
    var body: some View {
        VStack {
            Text("Hi Ayah Bunda, aku Tuntun, yang akan menemani perjalanan Ayah Bunda dan bayi di 1000 hari pertama kehidupannya!")
                .font(.title2)
                .bold()
                .padding()
            Button("Selanjutnya") {
                step == 0 ? step += 1 : nil
            }
        }.padding()
    }
}
