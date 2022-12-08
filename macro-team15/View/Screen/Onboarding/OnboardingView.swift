//
//  OnboardingView.swift
//  macro-team15
//
//  Created by Aditya Cahyo on 23/11/22.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
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
                        viewModel.finalStep()
                    }
                }
            }
            .foregroundColor(Color.ui.primary)
            .padding()
            
            Spacer()
            
            Group {
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
            
            Spacer()
        }
        .animation(.default, value: viewModel.step)
        .background {
            BackgroundView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
