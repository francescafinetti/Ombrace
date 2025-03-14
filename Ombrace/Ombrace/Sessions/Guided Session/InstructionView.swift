//
//  InstructionView.swift
//  Ombrace
//
//  Created by Serena Pia Capasso on 11/03/25.
//
import SwiftUI

struct InstructionView: View {
    let text: LocalizedStringKey
    @Binding var textVisible: Bool
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: min(UIScreen.main.bounds.width * 0.05, 18), weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.8) 
                .padding()
                .cornerRadius(12)
                .shadow(color: .white.opacity(0.4), radius: 6, x: 0, y: 3)
                .opacity(textVisible ? 1 : 0)
                .transition(.opacity)
                .animation(.easeInOut(duration: 1), value: textVisible)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
}

#Preview {
    GlowingBodyContainerView()
}
