import SwiftUI
import SwiftData
import UserNotifications
import AppIntents // 🔹 Importiamo App Intents per Siri

@main
struct OmbraceApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @UIApplicationDelegateAdaptor(NotificationDelegate.self) private var notificationDelegate
    
    
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .dark
        print("📢 OmbraceApp avviata!") // Debug
    }
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
    
    func setupNotifications() {
        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Errore nella richiesta di autorizzazione: \(error.localizedDescription)")
            } else {
                print("Autorizzazione concessa: \(granted)")
            }
        }
    }
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate, UIApplicationDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
