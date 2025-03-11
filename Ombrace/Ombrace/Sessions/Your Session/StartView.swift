import SwiftUI

struct StartView: View {
    @State private var isAnimating = false

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 30) {
                    AnimatedCircleView()
                        .frame(width: 250, height: 150)
                        .padding(.top, 60)

                    Text("Your Session")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)

                    VStack(spacing: 20) {
                        Text("A self-guided and personal space where you can select exercises, reflections, and practices that best support your journey toward self-acceptance.")
                        
                        Text("You're free to end the session anytime you need and repeat it whenever you want.")
                        
                        Text("Take a deep breath and begin when you're ready.")
                            .fontWeight(.bold)
                    }
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                    Spacer()
                    
                    NavigationLink(destination: IntertwinedCirclesView()) {
                        Text("Start")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: 220)
                            .background(
                                RoundedRectangle(cornerRadius: 28)
                                    .fill(Color.accent2)
                            )
                            .foregroundColor(.white)
                            
                    }
                    
                    .padding(.bottom, 70)
                }
            }
        }
    }
}

#Preview {
    StartView()
}
