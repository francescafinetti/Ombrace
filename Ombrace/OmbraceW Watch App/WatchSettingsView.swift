import SwiftUI
import UserNotifications

struct WatchSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @AppStorage("soundVolume") private var soundVolume: Double = 0.5
    @AppStorage("selectedSound") private var selectedSound: String = "None"
    @AppStorage("voiceEnabled") private var voiceEnabled: Bool = true
    @AppStorage("voiceVolume") private var voiceVolume: Double = 0.5
    @AppStorage("notificationsEnabled") private var notificationsEnabled: Bool = true
    @AppStorage("notificationTime") private var notificationTime: Date = Date()
    @State private var showingDatePicker = false
    let soundOptions = ["None", "Meditation", "Melody", "Piano", "Relaxing", "Yoga"]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Sound Settings").font(.caption).foregroundColor(.gray)) {
                    Toggle("Sound", isOn: $soundEnabled)

                    if soundEnabled {
                        Picker("Sound Type", selection: $selectedSound) {
                            ForEach(soundOptions, id: \.self) { sound in
                                Text(sound).tag(sound)
                            }
                        }
                        .pickerStyle(.navigationLink)

                        Slider(value: $soundVolume, in: 0...1, step: 0.1)
                            .accentColor(.blue)
                    }
                }
                
                Section(header: Text("Voice Settings").font(.caption).foregroundColor(.gray)) {
                    Toggle("Voice", isOn: $voiceEnabled)
                    
                    if voiceEnabled {
                        Slider(value: $voiceVolume, in: 0...1, step: 0.1)
                            .accentColor(.blue)
                    }
                }

                Section(header: Text("Notification Settings").font(.caption).foregroundColor(.gray)) {
                    Toggle("Notification", isOn: $notificationsEnabled)
                        .onChange(of: notificationsEnabled) { _, newValue in
                            if newValue {
                                requestNotificationPermission()
                            } else {
                                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                            }
                        }

                    if notificationsEnabled {
                        HStack {
                            Text("Notification Time")
                            Spacer()
                            Button(action: {
                                showingDatePicker.toggle()
                            }) {
                                Text(notificationTime, style: .time)
                                    .foregroundColor(.accent2)
                            }
                        }

                        if showingDatePicker {
                            DatePicker("Select Time", selection: $notificationTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                                .onChange(of: notificationTime) { _, _ in
                                    if notificationsEnabled {
                                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyNotification"])
                                        scheduleNotification(title: "Hey", body: "It's time for your session!", notificationTime: notificationTime)
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        } .tint(Color.accent2)
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, _ in
            if success {
                scheduleNotification(title: "Hey!", body: "It's time for your session!", notificationTime: notificationTime)
            }
        }
    }
    
    func scheduleNotification(title: String, body: String, notificationTime: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default

        let triggerDate = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)

        let request = UNNotificationRequest(identifier: "dailyNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    WatchSettingsView()
}
