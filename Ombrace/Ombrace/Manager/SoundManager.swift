import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?

    private init() {}

    func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            print("⚠️ Errore: Suono \(soundName) non trovato!")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("⚠️ Errore nella riproduzione di \(soundName): \(error.localizedDescription)")
        }
    }

    func playSelectedSound() {
        let selectedSound = UserDefaults.standard.string(forKey: "selectedSound") ?? "Default"
        playSound(named: selectedSound)
    }


func stopSound() {
        audioPlayer?.stop()
    }
}
