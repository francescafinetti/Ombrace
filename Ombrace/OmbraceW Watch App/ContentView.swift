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
                    Text("Hello, \(displayUsername)")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.leading)
                }
                .padding(.top, -35)
                .background(Color.black)
                
                ScrollView {
                    VStack(spacing: 15) {
                        NavigationLink(destination: WatchStartView2()) {
                            
                            WatchCardView(title: "Guided Session", subtitle: "4 MIN", icon: "guided")
                        }.buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: WatchStartView()) {
                            WatchCardView(title: "Your Session", subtitle: "4 MIN", icon: "your")
                        }  .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 5)
                }
            }
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    WatchContentView()
}
