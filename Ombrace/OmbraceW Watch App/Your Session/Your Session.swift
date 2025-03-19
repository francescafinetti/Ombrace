import SwiftUI
import AVFoundation

struct WatchIntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var showExitView = false
    @State private var showExitConfirmation = false
    @State private var navigateToWatchContentView = false
    @State private var sessionCompleted = false


    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @AppStorage("soundVolume") private var soundVolume: Double = 0.5
    @AppStorage("voiceVolume") private var voiceVolume: Double = 0.5
    
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
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    animazione()
                        .frame(width: 80, height: 10)
                }
                .onAppear {
                    animate.toggle()
                    startSession()
                }
                .onDisappear {
                    stopSession()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                Text(currentTexts[textIndex].text)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 160)
                    .fixedSize(horizontal: false, vertical: true)
                    .minimumScaleFactor(0.5)
                    .lineLimit(nil)
                    .padding()
                    .shadow(color: .white.opacity(0.4), radius: 5, x: 0, y: 2)
                    .transition(.opacity.combined(with: .scale))
                    .animation(.easeInOut(duration: 3), value: textIndex)
                    .padding(.horizontal, 10)
                    .padding(.top, 50)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width < -50 {
                        withAnimation {
                            showExitView = true
                        }
                    }
                }
        )
        .fullScreenCover(isPresented: $showExitView) {
            ExitView(showExitView: $showExitView, showExitConfirmation: $showExitConfirmation, navigateToWatchContentView: $navigateToWatchContentView)
        }
        .navigationDestination(isPresented: $navigateToWatchContentView) {
            WatchContentView()
        }
    }
    
    // MARK: - Avvio e Stop della Sessione
    
    private func startSession() {
        HapticManager.shared.startBreathingHaptic(intensity: "Medium")
        startTextTimer()

        if soundEnabled {
            SoundManager.shared.playSelectedSound(volume: soundVolume)
        } else {
            print("❌ Sound disattivato su Watch")
        }

        if voiceEnabled {
            print("🎙 Tentativo di avviare Voice su Watch")
            SoundManager.shared.playFreeAudio(volume: voiceVolume)
        } else {
            print("❌ Voice disattivato su Watch")
        }
    }

    private func stopSession() {
        textTimer?.invalidate()
        SoundManager.shared.stopSound()
        SoundManager.shared.stopFreeAudio()
        HapticManager.shared.stopBreathingHaptic()
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

}

#Preview {
    WatchIntertwinedCirclesView()
}
