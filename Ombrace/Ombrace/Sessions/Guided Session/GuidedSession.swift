//INSERIRE VIBRAZIONI - SUONO - DUE BUTTON PER ATTIVARLI E DISATTIVARLI ANCHE QUI COME NELLA YOUR SESSION - CAMBIARE OMINO - END SESSION E SI DEVE TOGLIERE IL BACK

import SwiftUI
import AVKit
import AVFoundation

struct GuidedSession: View {
    let selectedPath: String
    @State private var textIndex = 0
    @State private var textTimer: Timer?
    @State private var fadeIn = false
    @State private var player: AVPlayer
    
    init(selectedPath: String) {
        self.selectedPath = selectedPath
        if let videoURL = Bundle.main.url(forResource: "man", withExtension: "mp4") {
            self._player = State(initialValue: AVPlayer(url: videoURL))
        } else {
            self._player = State(initialValue: AVPlayer())
            print("Errore: Video non trovato nel bundle.")
        }
    }
    
    var currentTexts: [String] {
        selectedPath == "Top to Bottom" ? topToBottomTexts : bottomToTopTexts
    }
    
    var body: some View {
        VStack {
            Spacer()
            VideoBackgroundView(player: player)
                .opacity(fadeIn ? 1 : 0)
                .scaleEffect(fadeIn ? 1 : 0.9)
                .animation(.easeInOut(duration: 1), value: fadeIn)
                .ignoresSafeArea()
            
            VStack {
                Text(currentTexts[textIndex])
                    .foregroundColor(.white)
                    .bold()
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .opacity(fadeIn ? 1 : 0)
                    .scaleEffect(fadeIn ? 1 : 0.9)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1), value: fadeIn)
                    .padding(.bottom, 70)
                    .padding(.horizontal, 20)
            }
        }
        .onAppear {
            fadeIn = true
            startTextTimer()
            player.play()
        }
        .onDisappear {
            textTimer?.invalidate()
            player.pause()
        }
    }
    
    private func startTextTimer() {
        textTimer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            withAnimation {
                textIndex = (textIndex + 1) % currentTexts.count
            }
        }
    }
}

struct VideoBackgroundView: UIViewControllerRepresentable {
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

#Preview {
    GuidedSession(selectedPath: "Top to Bottom")
}
