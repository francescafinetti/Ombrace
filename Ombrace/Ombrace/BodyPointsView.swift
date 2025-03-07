//
//  BodyPointsView.swift
//  Ombrace
//
//  Created by Serena Pia Capasso on 07/03/25.
//

import SwiftUI

struct BodyPointsView: View {
    @Binding var highlightedPoints: [BodyPoint]
    var geometry: GeometryProxy

    private let points: [BodyPoint: CGPoint] = [
        
        .leftcheek: CGPoint(x: 0.30, y: 0.25), // Testa
        .rightcheek: CGPoint(x: 0.68, y: 0.25), // Testa
        
        .leftShoulder: CGPoint(x: 0.4, y: 0.38), // Spalla sinistra
        .rightShoulder: CGPoint(x: 0.6, y: 0.38), // Spalla destra
        .heart: CGPoint(x: 0.45, y: 0.4), // Cuore
        .stomach: CGPoint(x: 0.48, y: 0.5), // Stomaco
        .out: CGPoint(x: -10.0, y: -10.0),
        .rightelbow: CGPoint(x: 0.76, y: 0.5),
        .leftelbow: CGPoint(x: 0.2, y: 0.5),
        .righthand: CGPoint(x: 0.6, y: 0.5),
        .lefthand: CGPoint(x: 0.42, y: 0.48),
        .rightarm: CGPoint(x: 0.65, y: 0.42),
        
        .leftarm: CGPoint(x: 0.35, y: 0.42)
        
        
    
    ]

    var body: some View {
        ForEach(BodyPoint.allCases, id: \.self) { point in
            SessionCircleView()
               .opacity(highlightedPoints.contains(point) ? 1 : 0) // Mostra solo il punto evidenziato
                .position(x: points[point]!.x * geometry.size.width,
                                          y: points[point]!.y * geometry.size.height)
                    .animation(.easeInOut(duration: 0.5), value: highlightedPoints) 
        }
    }

}

#Preview {
    ZStack {
        GeometryReader { geometry in
            BodyPointsView(highlightedPoints: .constant([.righthand, .rightShoulder]), geometry: geometry)
        }
        FluidHumanFigureView()
    }
}

