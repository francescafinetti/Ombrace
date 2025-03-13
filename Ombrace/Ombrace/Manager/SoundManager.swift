import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    private var fadeTimer: Timer?

    private init() {}

    func playSound(named soundName: String, fadeInDuration: TimeInterval = 2.0) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("⚠️ Errore: Suono \(soundName) non trovato!")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // 🔄 Loop infinito
            audioPlayer?.volume = 0
            audioPlayer?.play()
            fadeIn(to: 1.0, duration: fadeInDuration)
        } catch {
            print("⚠️ Errore nella riproduzione di \(soundName): \(error.localizedDescription)")
        }
    }
    
    func playSelectedSound(fadeInDuration: TimeInterval = 2.0) {
        let selectedSound = UserDefaults.standard.string(forKey: "selectedSound") ?? "Default"
        playSound(named: selectedSound, fadeInDuration: fadeInDuration)
    }
    
    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil // 🔴 Ora l'istanza viene completamente eliminata
        fadeTimer?.invalidate()
        fadeTimer = nil
        print("🔇 Suono interrotto e memoria liberata!") // Debug: Controlliamo se viene chiamato
    }

    private func fadeIn(to targetVolume: Float, duration: TimeInterval) {
        let fadeSteps = 20
        let stepTime = duration / Double(fadeSteps)
        let volumeIncrement = targetVolume / Float(fadeSteps)
        
        fadeTimer?.invalidate()
        fadeTimer = Timer.scheduledTimer(withTimeInterval: stepTime, repeats: true) { [weak self] timer in
            guard let self = self, let player = self.audioPlayer else {
                timer.invalidate()
                return
            }
            if player.volume < targetVolume {
                player.volume += volumeIncrement
            } else {
                player.volume = targetVolume
                timer.invalidate()
            }
        }
    }
}
