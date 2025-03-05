import SwiftUI
import SwiftData
import UserNotifications

@main
struct OmbraceApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    init() {
        UIView.appearance().overrideUserInterfaceStyle = .dark
        setupNotifications()
    }

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                ContentView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(sharedModelContainer)
    }

    func setupNotifications() {
        let center = UNUserNotificationCenter.current()
        center.delegate = NotificationDelegate()

        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Errore nella richiesta di autorizzazione: \(error.localizedDescription)")
            } else {
                print("Autorizzazione concessa: \(granted)")
            }
        }
    }
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound]) // Mostra la notifica anche in foreground
    }
}
