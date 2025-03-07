import SwiftUI

struct GuidedCountdownView: View {
    let selectedPath: String
    @State private var countdown = 5
    @State private var navigateToSession = false
    @State private var fadeOut = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if !navigateToSession {
                Text("\(countdown)")
                    .font(.system(size: 100, weight: .bold))
                    .foregroundColor(.accent2)
                    .scaleEffect(fadeOut ? 2 : 1)
                    .opacity(fadeOut ? 0 : 1)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1), value: fadeOut)
            }

            if navigateToSession {
                GuidedSession(selectedPath: selectedPath)
                    .transition(.opacity)
            }
        }
        .onAppear {
            startCountdown()
        }
    }

    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 1 {
                countdown -= 1
            } else {
                timer.invalidate()
                withAnimation(.easeInOut(duration: 1)) {
                    fadeOut = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    navigateToSession = true
                }
            }
        }
    }
}

#Preview {
    GuidedCountdownView(selectedPath: "Top to Bottom")
}
