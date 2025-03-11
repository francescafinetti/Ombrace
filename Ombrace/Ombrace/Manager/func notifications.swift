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
    content.title = NSLocalizedString(title, comment: "Title of the notification that will receive the user, the information is the next one: Hey, Esername ⏰")
    content.body = NSLocalizedString(body, comment: "Body of the notification that will receive the user, the information is the next one: Time for your session!")
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

