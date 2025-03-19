//
//  OmbraceWApp.swift
//  OmbraceW Watch App
//
//  Created by Francesca Finetti on 17/03/25.
//

import SwiftUI
import UserNotifications

@main
struct OmbraceW_Watch_AppApp: App {
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    @AppStorage("notificationTime") private var notificationTime: Date = Date()

    init() {
        print("📢 OmbraceW Watch App avviata!")
    }

    var body: some Scene {
        WindowGroup {
            WatchContentView()
                .tint(Color.accent2)
                .onAppear {
                    if notificationsEnabled {
                        requestNotificationPermission()
                    }
                }
        }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                print("✅ Notifiche autorizzate su Watch")
                scheduleNotification(title: "Reminder", body: "It's time for your session!", notificationTime: notificationTime)
            } else if let error = error {
                print("❌ Errore autorizzazione notifiche: \(error.localizedDescription)")
            }
        }
    }

    private func scheduleNotification(title: String, body: String, notificationTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)

        let request = UNNotificationRequest(identifier: "dailyNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("❌ Errore nella programmazione della notifica: \(error.localizedDescription)")
            } else {
                print("✅ Notifica programmata con successo per \(notificationTime)")
            }
        }
    }
}

#Preview {
    WatchContentView()
}
