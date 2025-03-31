import SwiftUI
import UserNotifications

struct NotificationToggleView: View {
    @AppStorage("notificationsEnabled") var notificationsEnabled: Bool = false
    @State private var showPermissionAlert = false

    var body: some View {
        VStack {
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
                .onChange(of: notificationsEnabled) { newValue in
                    if newValue {
                        requestNotificationPermission()
                    } else {
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        print("🔕 Notifiche disattivate manualmente")
                    }
                }
                .onAppear {
                    checkNotificationAuthorizationStatus()
                }
        }
        .padding()
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Errore nella richiesta di permesso: \(error.localizedDescription)")
                    notificationsEnabled = false
                } else if granted {
                    notificationsEnabled = true
                    print("✅ Permesso notifiche concesso")
                } else {
                    print("❌ Permesso notifiche negato")
                    notificationsEnabled = false
                    // Mostra alert con pulsante per aprire le impostazioni
                    showPermissionAlert = true
                }
            }
        }
    }

    func checkNotificationAuthorizationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                notificationsEnabled = (settings.authorizationStatus == .authorized)
                print("🔍 Stato permessi: \(settings.authorizationStatus.rawValue)")
            }
        }
    }
}
