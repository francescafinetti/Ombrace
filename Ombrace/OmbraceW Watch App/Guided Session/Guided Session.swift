import SwiftUI
struct GuidedSession: View {
    @State private var animate = false
    @State private var text2Index = 0
    @State private var text2Timer: Timer?
    @State private var showExitView = false
    @State private var showExitConfirmation = false
    @State private var navigateToWatchContentView = false

    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @AppStorage("soundVolume") private var soundVolume: Double = 0.5
    @AppStorage("voiceVolume") private var voiceVolume: Double = 0.5

    private func getCurrentLanguageForGuided() -> String {
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

    private var currentTexts2: [(text: LocalizedStringKey, duration: TimeInterval)] {
        return textsByLanguageGuided[getCurrentLanguageForGuided(), default: textsByLanguageGuided["en"]!]
    }

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    GuidedAnimation()
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
                Text(currentTexts2[safe: text2Index]?.text ?? LocalizedStringKey("Error loading text"))
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
                    .animation(.easeInOut(duration: 3), value: text2Index)
                    .padding(.horizontal, 10)
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

    private func startSession() {
        startText2Timer()

        if soundEnabled {
            SoundManager.shared.playSelectedSound(volume: soundVolume)
        } else {
            print("❌ Suono disattivato")
        }

        if voiceEnabled {
            print("🎙 Avvio della voce")
            SoundManager.shared.playGuidedAudio(volume: voiceVolume)
        } else {
            print("❌ Voce disattivata")
        }
    }

    private func startText2Timer() {
        guard !currentTexts2.isEmpty else { return }

        let duration = currentTexts2[safe: text2Index]?.duration ?? 5

        text2Timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            if text2Index < currentTexts2.count - 1 {
                withAnimation {
                    text2Index += 1
                }
                WKInterfaceDevice.current().play(.click)
                startText2Timer()
            } else {
                text2Timer?.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    stopSession()
                }
            }
        }
    }

    private func stopSession() {
        text2Timer?.invalidate()
        SoundManager.shared.stopSound()
        SoundManager.shared.stopGuidedAudio()
    }
}

// 🔹 Estensione per evitare crash se l'array è fuori range
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    GuidedSession()
}
