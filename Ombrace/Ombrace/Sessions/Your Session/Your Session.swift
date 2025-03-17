import SwiftUI
import AVFoundation
import AppIntents

struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @State private var sessionCompleted = false
    @State private var showExitConfirmation = false
    @State private var navigateToContentView = false

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
                        Button("Cancel", role: .cancel) { }
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
                    stopSession()
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
    
    // MARK: - Avvio e Stop della Sessione
    
    private func startSession() {
        startTextTimer()
        
        if soundEnabled {
            SoundManager.shared.playSelectedSound()
        } else {
            print("❌ Sound disattivato")
        }
        
        if voiceEnabled {
            print("🎙 Tentativo di avviare Voice")
            SoundManager.shared.playFreeAudio()
        } else {
            print("❌ Voice disattivato")
        }
    }
    
    private func stopSession() {
        textTimer?.invalidate()
        SoundManager.shared.stopSound()
        SoundManager.shared.stopFreeAudio()
    }

    // MARK: - Timer Testo
    
    private func startTextTimer() {
        textTimer = Timer.scheduledTimer(withTimeInterval: 9, repeats: true) { _ in
            if textIndex < texts.count - 1 {
                withAnimation {
                    textIndex += 1
                }
            } else {
                textTimer?.invalidate()
                withAnimation {
                    sessionCompleted = true
                }
            }
        }
    }

    // MARK: - Uscita dalla Sessione
    
    private func exitSession() {
        stopSession()
        navigateToContentView = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView()
    }
}
