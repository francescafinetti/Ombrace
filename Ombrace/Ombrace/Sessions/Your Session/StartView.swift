import SwiftUI
import CoreHaptics

struct StartView: View {
    @State private var isAnimating = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 40) {
                AnimatedCircleView()
                    .frame(width: 500, height: 150)
                
                Text("Welcome to \nYour Session")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("Take a deep breath and begin when you're ready.")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                NavigationLink(destination: IntertwinedCirclesView()) {
                    Text("Start")
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
                .simultaneousGesture(TapGesture().onEnded {
                    
                })
                
            } .padding(.bottom, 100)
        }
    }
}


#Preview {
    StartView()
}
