import SwiftUI
import WatchKit

class HapticManager {
    static let shared = HapticManager()
    private var isPlaying = false

    func startBreathingHaptic(intensity: String) {
        guard !isPlaying else { return }
        isPlaying = true

        let intensityType: WKHapticType = {
            switch intensity {
            case "Soft": return .notification
            case "Medium": return .success
            case "Strong": return .notification
            default: return .notification
            }
        }()

        func playBreathCycle() {
            guard self.isPlaying else { return }

            // 🔹 Inspirazione (4s) - Vibrazioni morbide, più distanziate
            for i in 0..<4 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.0) {
                    WKInterfaceDevice.current().play(intensityType)
                }
            }

            // 🔹 Pausa (6s) - Nessuna vibrazione
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { }

            // 🔹 Espirazione (6s) - Vibrazioni più lente e distanziate
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) {
                for i in 0..<4 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 1.5) {
                        WKInterfaceDevice.current().play(.success)
                    }
                }
            }

            // 🔹 Ripeti il ciclo dopo 20s
            DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
                if self.isPlaying {
                    playBreathCycle()
                }
            }
        }

        playBreathCycle()
    }

    func stopBreathingHaptic() {
        isPlaying = false
    }
}
