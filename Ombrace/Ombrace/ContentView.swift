
import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isSettingsPresented = false
    @AppStorage("username") private var username: String = ""
    var displayUsername: String {
        username.isEmpty ? NSLocalizedString("User", comment: "Default username variable if the user dont set one, it is used on the greeting Hello, User") : username
    }
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(currentDateFormatted())
                            .font(.callout)
                            .foregroundColor(.gray)
                        Text("Hello, \(displayUsername)", comment:  "Title of the app, it give a greeting to the the user as Hello, UserName")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Button(action: {
                        isSettingsPresented.toggle()
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 25) {
                        NavigationLink(destination: GuidedStartView()) {
                            CardView(
                                title: "Guided Session",
                                subtitle: "4 MIN",
                                icon: "guided"
                                
                            )
                        }
                        
                        NavigationLink(destination: StartView()) {
                            CardView(
                                title: "Your Session",
                                subtitle: "4 MIN",
                                icon: "your"
                               
                            )
                        }
                    }
                }
                
            }
            .sheet(isPresented: $isSettingsPresented) {
                SettingsView()
            }
            
            
        } .accentColor(Color.accent2)
            .navigationBarBackButtonHidden(true)
        
        
    }
    
    
    private func currentDateFormatted() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.preferredLanguages.first ?? "en")
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: Date()).capitalized
    }
}

#Preview {
    ContentView()
}

