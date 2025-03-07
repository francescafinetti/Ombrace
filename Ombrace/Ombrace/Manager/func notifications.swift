import SwiftUI
import UserNotifications


func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Errore nella richiesta di permesso: \(error.localizedDescription)")
        } else if granted {
            print("Permesso per le notifiche concesso.")
        } else {
            print("Permesso per le notifiche negato.")
        }
    }
}

func scheduleNotification(title: String, body: String, notificationTime: Date) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
    let request = UNNotificationRequest(identifier: "dailyNotification", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Errore nella programmazione della notifica: \(error.localizedDescription)")
        } else {
            print("Notifica programmata con successo per \(dateComponents.hour!):\(dateComponents.minute!)")
        }
    }
}

