import SwiftUI

struct WatchIntertwinedCirclesView: View {
    @State private var animate = false
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var showExitView = false
    @State private var showExitConfirmation = false
    @State private var navigateToWatchContentView = false

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
                    textTimer?.invalidate()
                    HapticManager.shared.stopBreathingHaptic()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                Text(texts[textIndex])
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 140)
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
    
    private func startSession() {
        HapticManager.shared.startBreathingHaptic(intensity: "Medium")
        startTextTimer()
    }
    
    private func startTextTimer() {
        textTimer = Timer.scheduledTimer(withTimeInterval: 9, repeats: true) { _ in
            if textIndex < texts.count - 1 {
                withAnimation {
                    textIndex += 1
                }
                WKInterfaceDevice.current().play(.click) // Piccola vibrazione per segnalare il cambio testo
            } else {
                textTimer?.invalidate()
                HapticManager.shared.stopBreathingHaptic()
            }
        }
    }
}

#Preview {
    WatchIntertwinedCirclesView()
}
