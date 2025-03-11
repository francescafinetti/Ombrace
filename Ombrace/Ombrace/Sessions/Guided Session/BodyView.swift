//
//  BodyView.swift
//  Ombrace
//
//  Created by Serena Pia Capasso on 11/03/25.
//


import SwiftUI

struct BodyView: View {
    @Binding var leftPosition: CGPoint
    @Binding var rightPosition: CGPoint
    @Binding var scale: CGFloat
    @Binding var offset: CGSize
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("body")
                    .resizable()
                    .scaledToFill()
                    .padding(65.0)
                    .opacity(0.8)
                    
                
                SessionCircleView()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .position(leftPosition)
                
                SessionCircleView()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
                    .position(rightPosition)
            }
            .scaleEffect(scale)
            .offset(offset)
            .animation(.easeInOut(duration: 3), value: scale)
            .animation(.easeInOut(duration: 3), value: offset)
        }
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(
            leftPosition: .constant(CGPoint(x: 170, y: 155)),
            rightPosition: .constant(CGPoint(x: 320, y: 600)),
            scale: .constant(2.0),
            offset: .constant(CGSize(width: 100, height: 200))
        )
        .frame(width: 400, height: 800)
    }
}
