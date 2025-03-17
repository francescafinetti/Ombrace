import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    private var freePlayer: AVAudioPlayer?
    private var guidedPlayer: AVAudioPlayer?
    private var fadeTimer: Timer?

    private init() {
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: [.mixWithOthers, .duckOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("⚠️ Errore nella configurazione dell'AVAudioSession: \(error.localizedDescription)")
        }
    }

    // MARK: - Riproduzione Suoni

    func playSound(named soundName: String, fadeInDuration: TimeInterval = 2.0) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("⚠️ Errore: Suono \(soundName) non trovato!")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
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
        audioPlayer = nil
        fadeTimer?.invalidate()
        fadeTimer = nil
        print("🔇 Suono interrotto!")
    }

    func playFreeAudio(fadeInDuration: TimeInterval = 2.0) {
        playLocalizedAudio(prefix: "free_", fadeInDuration: fadeInDuration, player: &freePlayer)
    }

    func stopFreeAudio() {
        freePlayer?.stop()
        freePlayer = nil
        print("🔇 Audio free interrotto!")
    }

    func playGuidedAudio(fadeInDuration: TimeInterval = 2.0) {
        playLocalizedAudio(prefix: "guided_", fadeInDuration: fadeInDuration, player: &guidedPlayer)
    }

    func stopGuidedAudio() {
        guidedPlayer?.stop()
        guidedPlayer = nil
        print("🔇 Audio guided interrotto!")
    }

    // MARK: - Funzioni di Supporto

    private func getCurrentLanguage() -> String {
        let availableLanguages = ["it", "en", "fr", "es-419"]
        let preferredLanguage = Bundle.main.preferredLocalizations.first ?? "en"
        return availableLanguages.contains(preferredLanguage) ? preferredLanguage : "en"
    }

    private func playLocalizedAudio(prefix: String, fadeInDuration: TimeInterval, player: inout AVAudioPlayer?) {
        let language = getCurrentLanguage()
        let fileName = "\(prefix)\(language)"
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("⚠️ Errore: Audio \(fileName) non trovato!")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = 0
            player?.play()
            fadeIn(to: 1.0, duration: fadeInDuration, for: player)
        } catch {
            print("⚠️ Errore nella riproduzione di \(fileName): \(error.localizedDescription)")
        }
    }

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
