import AVFoundation
import SwiftUI

class VoiceGuide {
    let synthesizer = AVSpeechSynthesizer()
    
    func speak(_ text: String, voiceIdentifier: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(identifier: voiceIdentifier)
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.0
        
        synthesizer.speak(utterance)
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
