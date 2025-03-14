import SwiftUI
import AVFoundation
import AppIntents

struct IntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var isSoundOn = true
    @State private var sessionCompleted = false

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    textTimer?.invalidate()
                    SoundManager.shared.stopSound()
                    withAnimation {
                        sessionCompleted = true
                    }
                }) {
                    NavigationLink(destination: ExitSessionView()) {
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.accent2)
                            .bold()
                    }
                }
                .padding(10)
            }
            .padding(.horizontal)
            .padding(.top, 10)

            Spacer()
            
            ZStack {
                Color.black.ignoresSafeArea()
                animazione()
                    .frame(width: 300, height: 100) // Ridimensionato per una migliore adattabilità
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
                .frame(maxWidth: UIScreen.main.bounds.width * 0.8) // Evita che il testo sia troppo largo
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
                    sessionCompleted = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntertwinedCirclesView()
    }
}
