//
//  GlowingBodyContainerView.swift
//  Ombrace
//
//  Created by Serena Pia Capasso on 11/03/25.
//
import SwiftUI

struct GlowingBodyContainerView: View {
    @State private var activeStep = 0
    @State private var textVisible = false
    @State private var leftPosition = CGPoint(x: 80, y: 600)
    @State private var rightPosition = CGPoint(x: 320, y: 600)
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    var instructionVM = InstructionViewModel()

    // A dictionary to map each BodyPoint to a corresponding CGPoint
    private var bodyPointPositions: [BodyPoint: CGPoint] = [
        .leftcheek: CGPoint(x: 170, y: 155),
        .rightcheek: CGPoint(x: 230, y: 155),
        .leftShoulder: CGPoint(x: 110, y: 250),
        .rightShoulder: CGPoint(x: 290, y: 250),
        .heart: CGPoint(x: 170, y: 300),
        .stomach: CGPoint(x: 200, y: 450),
        .rightelbow: CGPoint(x: 320, y: 430),
        .leftelbow: CGPoint(x: 80, y: 430),
        .righthand: CGPoint(x: 320, y: 600),
        .lefthand: CGPoint(x: 80, y: 600),
        .rightarm: CGPoint(x: 310, y: 360),
        .leftarm: CGPoint(x: 90, y: 360)
    ]
    
    var body: some View {
        VStack {
            BodyView(leftPosition: $leftPosition, rightPosition: $rightPosition, scale: $scale, offset: $offset)
                .gesture(MagnificationGesture()
                    .onChanged { value in
                        scale = value.magnitude
                    })
            
            InstructionView(text: instructionVM.instructions[activeStep].text, textVisible: $textVisible)
                .onAppear {
                    advanceStep()
                }
        }
    }
    
    private func advanceStep() {
        if activeStep < instructionVM.instructions.count - 1 {
            withAnimation(.easeInOut(duration: 2)) {
                textVisible = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                activeStep += 1
                let instruction = instructionVM.instructions[activeStep]
                
                // Directly access the left and right body points from handposition
                let leftBodyPoint = instruction.handsposition.left
                let rightBodyPoint = instruction.handsposition.right
                
                withAnimation(.easeInOut(duration: 1)) {
                    // Set the positions of the left and right hands based on the body points
                    leftPosition = bodyPointPositions[leftBodyPoint] ?? leftPosition
                    rightPosition = bodyPointPositions[rightBodyPoint] ?? rightPosition
                    
                    // Use the custom scale and offset for this instruction
                    scale = instruction.scale
                    offset = instruction.offset
                }

                textVisible = true
            }
            
            // Continue the sequence
            DispatchQueue.main.asyncAfter(deadline: .now() + instructionVM.instructions[activeStep].duration) {
                advanceStep()
            }
        }
    }
}

#Preview {
    GlowingBodyContainerView()
}

