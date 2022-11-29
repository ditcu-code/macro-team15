//
//  GreetingOnboarding.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct GreetingOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack {
            OnboardingText(text: "Hi Ayah Bunda!\nAku Tuntun, yang akan menemani perjalanan Ayah Bunda dan bayi di 1000 hari pertamanya!")
                .offset(x: viewModel.step == 0 ? 0 : -UIScreen.main.bounds.height)
        }.padding(.bottom, 5)
        Button("Selanjutnya") {
            viewModel.nextStep()
        }.buttonStyle(PrimaryButtonStyle())
        
    }
}
