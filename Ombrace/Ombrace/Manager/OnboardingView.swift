//
//  OnBoardingView.swift
//  challenge5
//
//  Created by Francesca Finetti on 05/03/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @AppStorage("username") private var username: String = ""
    @State private var isAnimating = false
    @State private var currentPage: Int = 0
    @State private var tempUsername: String = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if currentPage == 0 {
                welcomeScreen
            } else {
                nameInputScreen
            }
        }
    }
    
    private var welcomeScreen: some View {
        
        
        VStack(spacing: 50) {
            
            AnimatedCircleView()
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            
            
            
            Text("Welcome to Ombrace!", comment: "The title of the Onboarding, Ombrace is the name of the App")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Text("Connect with your body and embrace self-kindness. Through guided exercises and mindfulness, you'll build a healthier, more balanced relationship with yourself—at your own pace, without pressure. \n\n You’re in the right place. Let’s begin.", comment: "The text of the onboarding")
                .font(.headline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            
            
            Button(action: {
                withAnimation {
                    currentPage = 1
                }
            }) {
                Text("Continue", comment: "A button to continue to the next screen of the onboarding")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accent2)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal, 40)
                
            }
        }
        .padding(.top, 50)
    }
    
    private var nameInputScreen: some View {
        VStack {
            Spacer()
            
            Text("How would you like to be called?", comment: "The title of the view where the user can insert their name inside a text field")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    .frame(height: 50)
                    .padding(.horizontal)
                
                TextField("Insert name", text: $tempUsername)
                    .padding()
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .background(Color.clear)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                if !tempUsername.isEmpty {
                    username = tempUsername
                }
                completeOnboarding()
            }) {
                Text("Continue", comment: "Button text to continue the onboarding process after the user has inserted their name")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accent2)
                    .bold()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Button(action: {
                completeOnboarding()
            }) {
                Text("Insert Later", comment: "Button text that is below a continue button, allowing the user to continue the onboarding process without entering a name")
                    .foregroundColor(.gray)
                    .bold()
            }
            .padding(.bottom, 20)
        }
        .padding()
    }
    
    private func completeOnboarding() {
        hasSeenOnboarding = true
    }
}

#Preview {
    OnboardingView()
}

