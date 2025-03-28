import SwiftUI
import AVFoundation

struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @AppStorage("soundVolume") private var soundVolume: Double = 0.5
    @AppStorage("voiceVolume") private var voiceVolume: Double = 0.5

    @State private var sessionCompleted = false
    @State private var showExitConfirmation = false
    @State private var navigateToContentView = false

    private func getCurrentLanguage() -> String {
        let preferredLanguage = Locale.preferredLanguages.first ?? "en"
        if preferredLanguage.starts(with: "it") {
            return "it"
        } else if preferredLanguage.starts(with: "fr") {
            return "fr"
        } else if preferredLanguage.starts(with: "es") {
            return "es-419"
        }
        return "en"
    }

    private var currentTexts: [(text: LocalizedStringKey, duration: TimeInterval)] {
        return textsByLanguage[getCurrentLanguage(), default: textsByLanguage["en"]!]
    }

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
                
                Text(currentTexts[textIndex].text) // 🔹 Usa currentTexts per il testo corretto
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
            SoundManager.shared.playSelectedSound(volume: soundVolume)
        } else {
            print("❌ Sound disattivato")
        }

        if voiceEnabled {
            print("🎙 Tentativo di avviare Voice")
            SoundManager.shared.playFreeAudio(volume: voiceVolume)
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
        guard textIndex < currentTexts.count else {
            textTimer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    sessionCompleted = true
                }
            }
            return
        }

        let duration = currentTexts[textIndex].duration

        textTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            if textIndex < currentTexts.count - 1 {
                withAnimation {
                    textIndex += 1
                    startTextTimer()
                }
            } else {
                textTimer?.invalidate()

                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        sessionCompleted = true
                    }
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
