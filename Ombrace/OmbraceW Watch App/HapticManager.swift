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
            case "Soft": return .click
            case "Medium": return .directionUp
            case "Strong": return .success
            default: return .directionUp
            }
        }()
        
        func playBreathCycle() {
            guard self.isPlaying else { return }
            
            // 🔹 Countdown - 5 vibrazioni singole prima di iniziare
            for i in 0..<5 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.8) {
                    WKInterfaceDevice.current().play(.click)
                }
            }
            
            // 🔹 Inspirazione (4s) - Vibrazioni leggere e progressive
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                for i in 0..<8 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.5) {
                        WKInterfaceDevice.current().play(.directionUp)
                    }
                }
            }
            
            // 🔹 Pausa (7s) - Nessuna vibrazione
            
            // 🔹 Espirazione (8s) - Vibrazioni leggere e decrescenti
            DispatchQueue.main.asyncAfter(deadline: .now() + 13.0) {
                for i in 0..<8 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.5) {
                        WKInterfaceDevice.current().play(.directionDown)
                    }
                }
            }
            
            // 🔹 Ripeti il ciclo dopo 18s
            DispatchQueue.main.asyncAfter(deadline: .now() + 18.0) {
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
