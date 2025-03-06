//
//  Untitled.swift
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
        VStack(spacing: 10) {
            
            Image("prova")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isAnimating ? 220 : 250, height: isAnimating ? 220 : 250)
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                        .padding(.bottom, 50)
            
            Text("Welcome to Ombrace!")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding()
            
            Text("Connect with your body and embrace self-kindness. Through guided exercises and mindfulness, you'll build a healthier, more balanced relationship with yourself—at your own pace, without pressure. \n\n You’re in the right place. Let’s begin.")
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom, 30)
                


            Button(action: {
                withAnimation {
                    currentPage = 1
                }
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accent2)
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 30)

            }
        }
        .padding(.top, 50)
    }

    private var nameInputScreen: some View {
        VStack {
            Spacer()

            Text("How would you like to be called?")
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
                Text("Continue")
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
                Text("Insert Later")
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
