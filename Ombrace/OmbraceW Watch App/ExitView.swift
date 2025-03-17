import SwiftUI

struct ExitView: View {
    @Binding var showExitView: Bool
    @Binding var showExitConfirmation: Bool
    @Binding var navigateToWatchContentView: Bool  // Binding per navigare alla ContentView
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                Button(action: {
                    showExitConfirmation = true
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.red)
                        .background(Color.black.opacity(0.7).clipShape(Circle()))
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Are you sure you want to leave?", isPresented: $showExitConfirmation) {
                    Button("Cancel", role: .cancel) {
                        showExitView = true  // Mantiene aperta la schermata
                    }
                    Button("Leave", role: .destructive) {
                        exitSession()
                    }
                }
                Spacer()
            }
        }
    }
    
    private func exitSession() {
        showExitView = false
        navigateToWatchContentView = true  // Attiva la navigazione nella view superiore
    }
}

#Preview {
    ExitView(showExitView: .constant(true), showExitConfirmation: .constant(false), navigateToWatchContentView: .constant(false))
}
