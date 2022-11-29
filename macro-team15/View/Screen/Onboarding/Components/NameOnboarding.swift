//
//  NameOnboarding.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct NameOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Group {
            HStack {
                OnboardingText(text: "Yuk, isi nama bayi yang akan Tuntun temani perjalanannya").padding(.bottom, 5)
                Spacer()
            }.offset(x: viewModel.step == 1 ? 0 : -UIScreen.main.bounds.height)
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
