//
//  DateOnboarding.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

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

struct OvalWhiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 1)
    }
}
