//
//  SessionCircleView.swift
//  Ombrace
//
//  Created by Serena Pia Capasso on 07/03/25.
//


import SwiftUI

struct SessionCircleView: View {
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
                    .frame(width: animate ? 50 : 80, height: animate ? 50 : 80)
                    .rotationEffect(.degrees(animate ? 360 : 0))
                    .scaleEffect(animate ? 1.4 : 0.7)
                    .blur(radius: animate ? 15 : 5)
                    .opacity(0.9)
                    .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                    .overlay(
                        Circle()
                            .stroke(Color.yellow.opacity(0.1), lineWidth: 2)
                            .scaleEffect(animate ? 1.6 : 1)
                            .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                    )
                    .overlay(
                        Circle()
                            .stroke(Color.yellow.opacity(0.1), lineWidth: 2)
                            .scaleEffect(animate ? 2.2 : 1)
                            .animation(Animation.easeInOut(duration: 6).repeatForever(autoreverses: true), value: animate)
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    SessionCircleView()
    
}


