import SwiftUI

struct GuidedSession: View {
    @State private var animate = false
    @State private var text2Index = 0
    @State private var text2Timer: Timer?
    @State private var showExitView = false
    @State private var showExitConfirmation = false
    @State private var navigateToWatchContentView = false

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
                    text2Timer?.invalidate()
                    HapticManager.shared.stopBreathingHaptic()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                Text(texts2[text2Index])
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
        HapticManager.shared.startBreathingHaptic(intensity: "Soft")
        startText2Timer()
    }
    
    private func startText2Timer() {
        text2Timer = Timer.scheduledTimer(withTimeInterval: 12, repeats: true) { _ in
            if text2Index < texts2.count - 1 {
                withAnimation {
                    text2Index += 1
                }
                WKInterfaceDevice.current().play(.click)
            } else {
                text2Timer?.invalidate()
                HapticManager.shared.stopBreathingHaptic()
            }
        }
    }
}

#Preview {
    GuidedSession()
}
