//NON VA

import AppIntents

struct StartSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Start Your Session"
    static var description = IntentDescription("Opens the interactive session.")
    static var suggestedInvocationPhrase = "Start your session"

    static var openAppWhenRun = true // 🔹 Assicura che Siri apra l'app

    @MainActor
    func perform() async throws -> some IntentResult {
        print("🟢 Siri ha attivato la sessione!") // 🔹 Debug per Xcode
        NotificationCenter.default.post(name: .startSessionNotification, object: nil)
        return .result(value: "Session started") // 🔹 Siri confermerà l'azione
    }
}

struct StartGuidedSessionIntent: AppIntent {
    static var title: LocalizedStringResource = "Start Guided Session"
    static var description = IntentDescription("Opens the guided session with animations and sounds.")
    static var suggestedInvocationPhrase = "Start guided session"

    static var openAppWhenRun = true // 🔹 Assicura che Siri apra l'app

    @MainActor
    func perform() async throws -> some IntentResult {
        print("🟢 Siri ha attivato la sessione guidata!") // 🔹 Debug per Xcode
        NotificationCenter.default.post(name: .startGuidedSessionNotification, object: nil)
        return .result(value: "Guided session started") // 🔹 Siri confermerà l'azione
    }
}

// 📌 Estensione per le notifiche
extension Notification.Name {
    static let startSessionNotification = Notification.Name("startSessionNotification")
    static let startGuidedSessionNotification = Notification.Name("startGuidedSessionNotification")
}
