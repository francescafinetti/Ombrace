import SwiftUI

struct GuidedAnimation: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<3, id: \ .self) { i in
                Circle()
                    .fill(AngularGradient(gradient: Gradient(colors: [
                        Color.yellow.opacity(0.8),
                        Color.accent2.opacity(0.9),
                        Color.red.opacity(0.8),
                        Color.white.opacity(0.5)
                    ]), center: .center))
                    .frame(width: animate ? 120 : 60, height: animate ? 120 : 60)
                    .offset(x: animate ? CGFloat(i * 40 - 20) : CGFloat(-i * 40 + 20),
                            y: animate ? CGFloat(i * -20 + 10) : CGFloat(i * 20 - 10))
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .scaleEffect(animate ? 1.5 : 0.7)
                    .blur(radius: animate ? 10 : 3)
                    .animation(Animation.easeInOut(duration: 5)
                        .repeatForever(autoreverses: true), value: animate)
                    .overlay(
                        Circle()
                            .stroke(Color.orange.opacity(0.3), lineWidth: 2)
                            .scaleEffect(animate ? 1.8 : 1)
                            .animation(Animation.easeInOut(duration: 5)
                                .repeatForever(autoreverses: true), value: animate)
                    )
                    .overlay(
                        Circle()
                            .stroke(Color.accent2.opacity(0.2), lineWidth: 2)
                            .scaleEffect(animate ? 2.0 : 1)
                            .animation(Animation.easeInOut(duration: 5)
                                .repeatForever(autoreverses: true), value: animate)
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    GuidedAnimation()
}
