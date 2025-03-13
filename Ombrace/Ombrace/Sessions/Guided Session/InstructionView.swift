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
                .bold()
                .font(.body)
                .multilineTextAlignment(.center)
                .cornerRadius(12)
                .shadow(radius: 5)
                .opacity(textVisible ? 1 : 0)
                .transition(.opacity)
                .animation(.easeInOut(duration: 1), value: textVisible)
        }
        .padding(.bottom, 60)
    }
}

