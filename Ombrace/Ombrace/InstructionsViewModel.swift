//
//  InstructionsViewModel.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//

import Foundation


@Observable

class InstructionViewModel {
    var instructions = [
        Instruction(id: 1, bodyPoint: .out, text: "So now, we're going to practice together.", duration: 5),
        Instruction(id: 2, bodyPoint: .out, text: "And please, try to follow along.", duration: 5),
        Instruction(id: 3, bodyPoint: .head, text: "Just begin by bringing one hand up to your cheek and cradling your face in your hands.", duration: 5),
        Instruction(id: 4, bodyPoint: .head, text: "You can close your eyes if you like, so that you can pay attention to what’s happening in your body.", duration: 5),
        Instruction(id: 5, bodyPoint: .head, text: "Just feeling the contact of this hand.", duration: 5),
        Instruction(id: 6, bodyPoint: .leftShoulder, text: "Move your hands down a little bit to your shoulder.", duration: 5),
        Instruction(id: 7, bodyPoint: .rightShoulder, text: "Just resting gently on your shoulders, and notice—how does this feel?", duration: 5)
        // Altre istruzioni possono essere aggiunte qui...
    ]
}
