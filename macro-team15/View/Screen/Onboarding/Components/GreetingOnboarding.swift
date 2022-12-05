//
//  GreetingOnboarding.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 28/11/22.
//

import SwiftUI

struct GreetingOnboarding: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @ObservedObject var appData = AppData()
    @State private var counter = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            OnboardingText(text: "Hi Ayah Bunda!\nAku Tuntun, yang akan menemani perjalanan Ayah Bunda dan bayi di 1000 hari pertamanya!")
                .offset(x: viewModel.step == 0 ? 0 : -UIScreen.main.bounds.height)
                .opacity(counter > 2 ? 1 : 0)
        }
        .padding(.bottom, 5)
        .onReceive(timer) { time in
            if counter == 7 {
                timer.upstream.connect().cancel()
            } else {
                print("The time is now \(time)")
            }
            withAnimation(.easeInOut(duration: 1)) {
                counter += 1
            }
        }
        Button("Mulai") {
            let babies = Baby.getAll()
            if babies.isEmpty {
                viewModel.nextStep()
            } else {
                if let baby = babies.first {
                    let selectedMonth = Calendar.current.dateComponents([.month], from: baby.birthDate!, to: Date()).month ?? 0
                    viewModel.setAppDatas(baby.id!, baby.name!, selectedMonth)
                    AppData.setIsDoneOnboarding(true)
                    AppData.setUserHasInstalled(true)
                }
            }
        }
        .buttonStyle(PrimaryButtonStyle())
        .disabled(counter > 6 ? false : true)
        .opacity(counter > 6 ? 1 : 0)
    }
}
