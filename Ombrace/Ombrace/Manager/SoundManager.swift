import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    private var freePlayer: AVAudioPlayer?
    private var guidedPlayer: AVAudioPlayer?
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
            fadeIn(to: 1.0, duration: fadeInDuration, for: audioPlayer)
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
        print("🔇 Suono interrotto e memoria liberata!") // Debug
    }

    // 🔊 Riproduce l’audio "free_" nella lingua corrente
    func playFreeAudio(fadeInDuration: TimeInterval = 2.0) {
        playLocalizedAudio(prefix: "free_", fadeInDuration: fadeInDuration, player: &freePlayer)
    }

    // 🛑 Ferma SOLO l’audio "free_"
    func stopFreeAudio() {
        freePlayer?.stop()
        freePlayer = nil
        print("🔇 Audio free interrotto!")
    }

    // 🎤 Riproduce l’audio "guided_" nella lingua corrente
    func playGuidedAudio(fadeInDuration: TimeInterval = 2.0) {
        playLocalizedAudio(prefix: "guided_", fadeInDuration: fadeInDuration, player: &guidedPlayer)
    }

    // 🛑 Ferma SOLO l’audio "guided_"
    func stopGuidedAudio() {
        guidedPlayer?.stop()
        guidedPlayer = nil
        print("🔇 Audio guided interrotto!")
    }

    // 🌍 Ottiene la lingua corrente dell’app
    private func getCurrentLanguage() -> String {
        let availableLanguages = ["it", "en", "fr", "es-419"]
        let preferredLanguage = Bundle.main.preferredLocalizations.first ?? "en"
        return availableLanguages.contains(preferredLanguage) ? preferredLanguage : "en"
    }

    // 🎶 Funzione generica per riprodurre file localizzati ("free_" o "guided_")
    private func playLocalizedAudio(prefix: String, fadeInDuration: TimeInterval, player: inout AVAudioPlayer?) {
        let language = getCurrentLanguage()
        let fileName = "\(prefix)\(language)"
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("⚠️ Errore: Audio \(fileName) non trovato!")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1  // 🔄 Loop infinito
            player?.volume = 0
            player?.play()
            fadeIn(to: 1.0, duration: fadeInDuration, for: player)
        } catch {
            print("⚠️ Errore nella riproduzione di \(fileName): \(error.localizedDescription)")
        }
    }

    // 🔄 Fade-in progressivo per un audio specifico
    private func fadeIn(to targetVolume: Float, duration: TimeInterval, for player: AVAudioPlayer?) {
        let fadeSteps = 20
        let stepTime = duration / Double(fadeSteps)
        let volumeIncrement = targetVolume / Float(fadeSteps)
        
        fadeTimer?.invalidate()
        fadeTimer = Timer.scheduledTimer(withTimeInterval: stepTime, repeats: true) { [weak self] timer in
            guard let self = self, let player = player else {
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
