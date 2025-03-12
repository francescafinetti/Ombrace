import SwiftUI
import AVFoundation

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
                .bold()
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 70)
                .multilineTextAlignment(.center)
                .transition(.opacity)
                .animation(.easeInOut(duration: 3), value: textIndex)
                .padding(.bottom, 40)
                .padding(.horizontal, 20)
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
