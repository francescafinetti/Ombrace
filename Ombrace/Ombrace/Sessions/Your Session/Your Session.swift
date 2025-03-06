//SI DEVE TOGLIERE IL BACK E METTERE UN END SESSION


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

    var hapticManager: HapticManager

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        isSoundOn.toggle()
                        if isSoundOn {
                            SoundManager.shared.playSelectedSound()
                        } else {
                            SoundManager.shared.stopSound()
                        }
                    }) {
                        Image(systemName: isSoundOn ? "speaker.wave.3.fill" : "speaker.slash.fill")
                            .font(.title2)
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
                        Image(systemName: isVibrationOn ? "iphone.radiowaves.left.and.right" : "iphone")
                            .font(.title2)
                            .foregroundColor(isVibrationOn ? .accent2 : .gray)
                            .padding()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)

                ZStack {
                    Color.black.ignoresSafeArea()

                    ForEach(0..<2, id: \.self) { i in
                        Circle()
                            .fill(RadialGradient(gradient: Gradient(colors: [
                                Color.yellow.opacity(0.7),
                                Color.accent2.opacity(0.8),
                                Color.red.opacity(0.9),
                                Color.white.opacity(0.6)
                            ]), center: .center, startRadius: 10, endRadius: 120))
                            .frame(width: animate ? 150 : 80, height: animate ? 150 : 80)
                            .offset(x: animate ? CGFloat(i * 80 - 40) : CGFloat(-i * 80 + 40),
                                    y: animate ? CGFloat(i * -40 + 20) : CGFloat(i * 40 - 20))
                            .rotationEffect(.degrees(animate ? 360 : 0))
                            .scaleEffect(animate ? 1.4 : 0.7)
                            .blur(radius: animate ? 15 : 5)
                            .opacity(isCountingDown ? 0.3 : 0.9)
                            .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                            .overlay(
                                Circle()
                                    .stroke(Color.accent2.opacity(0.1), lineWidth: 2)
                                    .scaleEffect(animate ? 1.6 : 1)
                                    .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.accent2.opacity(0.1), lineWidth: 2)
                                    .scaleEffect(animate ? 2.2 : 1)
                                    .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                            )
                    }

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
                        .padding(.bottom, 70)
                        .padding(.horizontal, 20)
                }
            }
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
            withAnimation {
                textIndex = (textIndex + 1) % texts.count
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView(hapticManager: HapticManager())
    }
}
