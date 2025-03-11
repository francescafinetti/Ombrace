import SwiftUI

struct GuidedStartView: View {
    @State private var navigateToSession = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Welcome to your Guided Session", comment: "Title that welcome the user after selecting Guided Session mode in the menu")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Image("body")
                    .resizable()
                    .scaledToFit()
                
                Text("Take a deep breath and begin when you're ready.", comment: "Text that explains the user how to start the session")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding()
            Button(action: {
                navigateToSession = true
            }) {
                Text("Start", comment: "Button to start the session.")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accent2)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal, 40)
            }
            .padding(.top, 100)
        }
        .navigationDestination(isPresented: $navigateToSession) {
            GlowingBodyView()
        }
    }
}


#Preview {
    GuidedStartView()
}
