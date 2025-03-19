import SwiftUI

struct WatchContentView: View {
    @AppStorage("username") private var username: String = ""
    
    var displayUsername: String {
        username.isEmpty ? NSLocalizedString("User", comment: "Default username") : username
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Hello!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading)
                    
                    Spacer()
                    
                    NavigationLink(destination: WatchSettingsView()) {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.trailing)
                        
                    }
                }
                .padding(.top, -22)
                .background(Color.black)
                .buttonStyle(PlainButtonStyle())
                
                ScrollView {
                    VStack(spacing: 15) {
                        NavigationLink(destination: WatchStartView2()) {
                            WatchCardView(title: "Guided Session", subtitle: "4 MIN", icon: "guided")
                        }.buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: WatchStartView()) {
                            WatchCardView(title: "Your Session", subtitle: "4 MIN", icon: "your")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 5)
                }
            }
        }.tint(Color.accent2)
            .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    WatchContentView()
}
