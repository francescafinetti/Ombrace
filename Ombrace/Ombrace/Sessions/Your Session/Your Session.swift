import SwiftUI
import CoreHaptics

struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var countdown = 5
    @State private var isCountingDown = true
    @State private var isSoundOn = true
    @State private var isVibrationOn = true
    @State private var sessionCompleted = false
    
    var hapticManager: HapticManager
    
    var body: some View {
        VStack {
            HStack() {
                Button(action: {
                    isSoundOn.toggle()
                    if isSoundOn {
                        SoundManager.shared.playSelectedSound()
                    } else {
                        SoundManager.shared.stopSound()
                    }
                }) {
                    Image(systemName: isSoundOn ? "speaker.wave.3.fill" : "speaker.slash.fill")
                        .foregroundColor(isSoundOn ? .accent2 : .gray)
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    isVibrationOn.toggle()
                    if isVibrationOn {
                        hapticManager.startBreathingHaptic(intensity: "Medium")
                    } else {
                        hapticManager.stopBreathingHaptic()
                    }
                }) {
                    Image(systemName: isVibrationOn ? "iphone.radiowaves.left.and.right" : "iphone.radiowaves.left.and.right")
                        .foregroundColor(isVibrationOn ? .accent2 : .gray)
                        .padding()
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
                
                Button(action: {
                    textTimer?.invalidate()
                    hapticManager.stopBreathingHaptic()
                    SoundManager.shared.stopSound()
                    withAnimation {
                        sessionCompleted = true
                    }
                }) {
                    NavigationLink(destination: CompletedView()) {
                        Text("End Session")
                            .font(.subheadline)
                            .bold()
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.gray.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 10)
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
        textTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView(hapticManager: HapticManager())
    }
}
