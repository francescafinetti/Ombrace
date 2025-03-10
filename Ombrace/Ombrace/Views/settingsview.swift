import SwiftUI
import AVFAudio
import UserNotifications

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("username") private var username: String = "example"
    @State private var notificationsEnabled: Bool = true
    @State private var notificationTime: Date = Date()
    @State private var selectedLanguage: String = "English (USA)"
    @State private var showingDatePicker = false
    @State private var showingLanguagePicker = false
    
    @AppStorage("soundEnabled") private var soundEnabled: Bool = true
    @AppStorage("selectedSound") private var selectedSound: String = "None"
    @State private var isSoundMenuExpanded: Bool = false
    
    let soundOptions = ["None", "Meditation", "Melody", "Piano", "Relaxing", "Yoga"]
    let languages = ["Italiano", "English (USA)", "Français", "Español"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("HOW WOULD YOU LIKE TO BE CALLED?").font(.caption).foregroundColor(.gray)) {
                    TextField("Enter your name", text: $username)
                        .cornerRadius(8)
                }
                
                Section(header: Text("Sound Settings")) {
                    Toggle("Sound", isOn: $soundEnabled)
                        .tint(Color.accent2)
                    
                    if soundEnabled {
                        DisclosureGroup(
                            isExpanded: $isSoundMenuExpanded,
                            content: {
                                ForEach(soundOptions, id: \ .self) { sound in
                                    HStack {
                                        Text(sound)
                                        Spacer()
                                        if selectedSound == sound {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(Color.accent2)
                                        }
                                    }
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        selectedSound = sound
                                    }
                                }
                            },
                            label: {
                                HStack {
                                    Text("Sound Type")
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation {
                                        isSoundMenuExpanded.toggle()
                                    }
                                }
                            }
                        )
                    }
                }
                
                
                Section(header: Text("Notification Settings")) {
                    Toggle("Notification", isOn: $notificationsEnabled)
                        .tint(Color.accent2)
                        .onChange(of: notificationsEnabled) { ldValue, newValue in
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
                                .datePickerStyle(WheelDatePickerStyle())
                                .labelsHidden()
                                .onChange(of: notificationTime) { oldValue, newValue in
                                    if notificationsEnabled {
                                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyNotification"])
                                        scheduleNotification(title: "Hey, \(username)! ⏰", body: "Time for your session!", notificationTime: notificationTime)
                                    }
                                }
                        }
                    }
                }
                
                Section(header: Text("Language Settings")) {
                    HStack {
                        Text("Language")
                        Spacer()
                        Button(action: {
                            showingLanguagePicker.toggle()
                        }) {
                            Text(selectedLanguage)
                                .foregroundColor(.accent2)
                        }
                    }
                    
                    if showingLanguagePicker {
                        Picker("Select Language", selection: $selectedLanguage) {
                            ForEach(languages, id: \ .self) { language in
                                Text(language)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                }
                
                Section {
                    NavigationLink(destination: InfoView()) {
                        Text("About")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button("Done")
                                {
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(selectedLanguage, forKey: "selectedLanguage")
                presentationMode.wrappedValue.dismiss()
            })
        }
        .accentColor(Color.accent2)
    }
    
}


#Preview {
    SettingsView()
}
