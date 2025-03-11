import SwiftUI

struct animazione2: View {
    @State private var isAnimating = false
    @State private var animate = false
    var body: some View {
        ZStack {
            ForEach(0..<2, id: \ .self) { i in
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [
                        Color.yellow.opacity(0.7),
                        Color.accent2.opacity(0.8),
                        Color.red.opacity(0.9),
                        Color.white.opacity(0.6)
                    ]), center: .center, startRadius: 10, endRadius: 120))
                    .frame(width: animate ? 150 : 80, height: animate ? 80 : 80)
                    .offset(x: animate ? CGFloat(i * 80 - 40) : CGFloat(-i * 80 + 40),
                            y: animate ? CGFloat(i * -40 + 20) : CGFloat(i * 40 - 20))
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .scaleEffect(animate ? 1.4 : 0.7)
                    .blur(radius: animate ? 15 : 5)
                    .animation(Animation.easeInOut(duration: 7)
                        .repeatForever(autoreverses: true), value: animate)
                
            }
        } .padding(.top, 100)
            .onAppear {
                animate.toggle()
            }
    }
}

//used on your session start view
