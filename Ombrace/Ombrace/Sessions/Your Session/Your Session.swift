import SwiftUI
import CoreHaptics
import AVFoundation


struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var countdown = 5
    @State private var isCountingDown = true
    @State private var isSoundOn = true
    @State private var isVibrationOn = true
    @State private var isVoiceOverOn = true
    @State private var sessionCompleted = false
    
    @AppStorage("selectedVoice") private var selectedVoice: String = AVSpeechSynthesisVoice.speechVoices().first?.identifier ?? ""
    
    let voiceGuide = VoiceGuide()
    var hapticManager: HapticManager
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button(action: {
                        isSoundOn.toggle()
                        if isSoundOn {
                            SoundManager.shared.playSelectedSound()
                        } else {
                            SoundManager.shared.stopSound()
                        }
                    }) {
                        Image(systemName: isSoundOn ? "apple.haptics.and.music.note" : "apple.haptics.and.music.note.slash")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(isSoundOn ? .accent2 : .gray)
                            .bold()
                    }
                    
                    Button(action: {
                        isVibrationOn.toggle()
                        if isVibrationOn {
                            hapticManager.startBreathingHaptic(intensity: "Medium")
                        } else {
                            hapticManager.stopBreathingHaptic()
                        }
                    }) {
                        Image(systemName: "iphone.radiowaves.left.and.right")
                            .resizable()
                            .frame(width: 32, height: 22)
                            .foregroundColor(isVibrationOn ? .accent2 : .gray)
                            .bold()
                    }
                    
                    
                    Button(action: {
                        toggleVoiceOver()
                    }) {
                        Image(systemName: isVoiceOverOn ? "person.wave.2.fill" : "person.wave.2.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(isVoiceOverOn ? .accent2 : .gray)
                            .bold()
                    }
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    textTimer?.invalidate()
                    hapticManager.stopBreathingHaptic()
                    SoundManager.shared.stopSound()
                    voiceGuide.stop()
                    withAnimation {
                        sessionCompleted = true
                    }
                }) {
                    NavigationLink(destination: CompletedView()) {
                        Image(systemName: "figure.walk.departure")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.accent2)
                            .bold()
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            ZStack {
                Color.black.ignoresSafeArea()
                animazione()
                    .frame(width: 500, height: 150)
                if isCountingDown {
                    Text("\(countdown)")
                        .font(.system(size: 1, weight: .bold))
                        .foregroundColor(.accent2)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1), value: countdown)
                }
            }
            .onAppear {
                animate.toggle()
                startCountdown()
            }
            .onDisappear {
                textTimer?.invalidate()
                hapticManager.stopBreathingHaptic()
                SoundManager.shared.stopSound()
                voiceGuide.stop()
            }
            
            if !isCountingDown {
                Text(texts[textIndex])
                    .foregroundColor(.white)
                    .bold()
                    .font(.body)
                    .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 70)
                    .multilineTextAlignment(.center)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 3), value: textIndex)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $sessionCompleted) {
            CompletedView()
        }
    }
    
    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 1 {
                countdown -= 1
            } else {
                timer.invalidate()
                withAnimation {
                    isCountingDown = false
                }
                startSession()
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
        if isVoiceOverOn {
            voiceGuide.speak(texts[textIndex], voiceIdentifier: selectedVoice)
        }
        
        textTimer = Timer.scheduledTimer(withTimeInterval: 9, repeats: true) { _ in
            if textIndex < texts.count - 1 {
                withAnimation {
                    textIndex += 1
                }
                if isVoiceOverOn {
                    voiceGuide.speak(texts[textIndex], voiceIdentifier: selectedVoice)
                }
            } else {
                textTimer?.invalidate()
                withAnimation {
                    sessionCompleted = true
                }
            }
        }
    }
    
    // 🔹 Funzione per attivare/disattivare la lettura del testo
    private func toggleVoiceOver() {
        isVoiceOverOn.toggle()
        if isVoiceOverOn {
            voiceGuide.speak(texts[textIndex], voiceIdentifier: selectedVoice)
        } else {
            voiceGuide.stop()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView(hapticManager: HapticManager())
    }
}
