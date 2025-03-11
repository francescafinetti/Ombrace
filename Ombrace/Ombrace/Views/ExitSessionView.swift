import SwiftUI

struct ExitSessionView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Image(systemName: "figure.walk.motion.trianglebadge.exclamationmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accent2)
                    .padding(.top, 20)
                
                Text("Are you sure you want to leave?")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.top)

                Text("It's okay to take a break. \nYou can always come back whenever you're ready.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                VStack(spacing: 20) {
                    NavigationLink(destination: ContentView()) {
                        Text("Leave Session")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: 250)
                            .background(
                                RoundedRectangle(cornerRadius: 28)
                                    .fill(Color.accent2)
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ExitSessionView()
}

