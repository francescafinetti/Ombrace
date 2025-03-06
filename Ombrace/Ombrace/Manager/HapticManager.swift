import CoreHaptics

class HapticManager {
    private var engine: CHHapticEngine?
    private var breathPlayer: CHHapticAdvancedPatternPlayer?
    private var isPlaying = false

    init() {
        prepareHaptics()
    }

    func prepareHaptics() {
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Haptic Engine Error: \(error.localizedDescription)")
        }
    }

    func startBreathingHaptic(intensity: String) {
            guard let engine = engine, !isPlaying else { return }
            isPlaying = true

            let intensityValue: Float
            switch intensity {
            case "Soft":
                intensityValue = 0.5
            case "Medium":
                intensityValue = 0.8
            case "Strong":
                intensityValue = 1.3
            default:
                intensityValue = 0.8
            }

        func playHapticPattern() {
            do {
                let pattern = try CHHapticPattern(events: [
                    // 🔹 Countdown - 5 colpetti singoli prima di iniziare
                    CHHapticEvent(eventType: .hapticTransient, parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 0.0),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 0.8),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 1.6),
                    CHHapticEvent(eventType: .hapticTransient, parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 2.4),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 3.2),
                    
                    // 🔹 Inspirazione (4s) - Pallini "titititi"
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 4.0),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 4.2),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 4.4),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 4.6),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 4.8),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 5.0),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 5.2),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 5.4),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 5.6),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 5.8),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 6.0),
                    
                    // 🔹 Pausa (7s) - Nessuna vibrazione
                    
                    // 🔹 Espirazione (8s) - Pallini "titititi"
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 13.0),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 13.3),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 13.6),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 13.9),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 14.2),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 14.5),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 14.8),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 15.1),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 15.4),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 15.7),
                    CHHapticEvent(eventType: .hapticTransient,  parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensityValue)
                    ], relativeTime: 16.0)
                ], parameters: [])

                breathPlayer = try engine.makeAdvancedPlayer(with: pattern)
                try breathPlayer?.start(atTime: 0)

                DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
                    if self.isPlaying {
                        playHapticPattern()
                    }
                }

            } catch {
                print("Failed to create haptic pattern: \(error.localizedDescription)")
            }
        }

        playHapticPattern()
    }

    func stopBreathingHaptic() {
        isPlaying = false
        do {
            try breathPlayer?.stop(atTime: 0)
        } catch {
            print("Failed to stop haptic: \(error.localizedDescription)")
        }
    }
}
