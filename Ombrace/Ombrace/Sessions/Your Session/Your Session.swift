import SwiftUI
import AVFoundation
import AppIntents

struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var isSoundOn = true
    @State private var sessionCompleted = false
    @State private var showExitConfirmation = false
    @State private var navigateToContentView = false  // Variabile per navigare a ContentView

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showExitConfirmation = true
                    }) {
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.accent2)
                            .bold()
                    }
                    .alert("Are you sure you want to leave?", isPresented: $showExitConfirmation) {
                        Button("Cancel", role: .cancel)
                        { }
                        Button("Leave", role: .destructive) {
                            exitSession()
                        } 
                    } message: {
                        Text("It's okay to take a break. \nYou can always come back whenever you're ready.")
                    }
                    .padding(10)
                }
                .padding(.horizontal)
                .padding(.top, 10)

                Spacer()
                
                ZStack {
                    Color.black.ignoresSafeArea()
                    animazione()
                        .frame(width: 300, height: 100)
                }
                .onAppear {
                    animate.toggle()
                    startSession()
                }
                .onDisappear {
                    textTimer?.invalidate()
                    SoundManager.shared.stopSound()
                }
                
                Text(texts[textIndex])
                    .foregroundColor(.white)
                    .font(.system(size: min(UIScreen.main.bounds.width * 0.05, 18), weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                    .padding()
                    .cornerRadius(16)
                    .shadow(color: .white.opacity(0.4), radius: 8, x: 0, y: 4)
                    .transition(.opacity.combined(with: .scale))
                    .animation(.easeInOut(duration: 3), value: textIndex)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $sessionCompleted) {
                CompletedView()
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
    
    private func startSession() {
        startTextTimer()
        if isSoundOn {
            SoundManager.shared.playSelectedSound()
        }
    }
    
    private func startTextTimer() {
        textTimer = Timer.scheduledTimer(withTimeInterval: 9, repeats: true) { _ in
            if textIndex < texts.count - 1 {
                withAnimation {
                    textIndex += 1
                }
            } else {
                textTimer?.invalidate()
                withAnimation {
                    sessionCompleted = true  // 🔹 Finisce e va a CompletedView
                }
            }
        }
    }

    private func exitSession() {
        textTimer?.invalidate()
        SoundManager.shared.stopSound()
        navigateToContentView = true  // 🔹 Torna a ContentView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView()
    }
}
