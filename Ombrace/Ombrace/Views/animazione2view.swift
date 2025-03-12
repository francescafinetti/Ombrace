import SwiftUI

struct animazione2: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<2, id: \.self) { i in
                Circle()
                    .fill(RadialGradient(gradient: Gradient(colors: [
                        Color.yellow.opacity(0.7),
                        Color.orange.opacity(0.8),
                        Color.red.opacity(0.9),
                        Color.white.opacity(0.6)
                    ]), center: .center, startRadius: 10, endRadius: 120))
                    .frame(width: animate ? 120 : 80, height: animate ? 120 : 80)
                    .offset(x: animate ? CGFloat(i == 0 ? -60 : 60) : 0,
                            y: animate ? CGFloat(i == 0 ? -30 : 30) : 0)
                    .rotationEffect(.degrees(animate ? 180 : 0))
                    .scaleEffect(animate ? 1.2 : 0.8)
                    .blur(radius: animate ? 10 : 5)
                    .animation(Animation.easeInOut(duration: 6)
                        .repeatForever(autoreverses: true)
                        .delay(Double(i) * 0.5), value: animate)
            }
        }
        .padding(.top, 100)
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    animazione2()
}
