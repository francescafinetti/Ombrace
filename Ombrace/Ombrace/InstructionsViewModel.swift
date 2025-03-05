//
//  InstructionsViewModel.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//

import Foundation



@Observable

class InstructionViewModel {
    var instructions =  [
        Instruction(id: 1, position: (0,0.10), text: "So now, we're going to practice together.", duration: 5),
        Instruction(id: 2, position: (0,0.11), text: "And please, try to follow along.", duration: 5),
        Instruction(id: 3, position: (0.6,0.15), text: "Just begin by bringing one hand up to your cheek and cradling your face in your hands.", duration: 5),
        Instruction(id: 4, position: (0.8,0.15), text: "You can close your eyes if you like, so that you can pay attention to what’s happening in your body.", duration: 5),
        Instruction(id: 5, position: (0.10,0.15), text: "Just feeling the contact of this hand.", duration: 5),
        Instruction(id: 6, position: (0.25,0.3), text: "Move your hands up a little bit to your shoulders.", duration: 5),
        Instruction(id: 7, position: (0.25,0.3), text: "Just resting gently on your shoulders, and notice—how does this feel?", duration: 5),
        Instruction(id: 8, position: (0,0), text: "Bring your arms down.", duration: 5),
        Instruction(id: 9, position: (0,0), text: "If you like, you can move your hand a little bit, imagining that this person is a human being who needs and deserves understanding and compassion.", duration: 5),
        Instruction(id: 10, position: (0.55,0.35), text: "Continue by bringing up one of your hands and placing it gently over your heart space.", duration: 5),
        Instruction(id: 11, position: (0.55,0.35), text: "What does it feel like when you put a hand over your heart?", duration: 5),
        Instruction(id: 12, position: (0.55,0.35), text: "Now bring up your other hand, placing it on top of the first hand, or next to it if that feels more comfortable.", duration: 5),
        Instruction(id: 13, position: (0.55,0.35), text: "Just taking a moment to feel these two hands, perhaps imagining that they are caring hands, offering kindness and warmth.", duration: 5),
        Instruction(id: 14, position: (0,0), text: "Bringing your hands down to cup your elbows.", duration: 5),
        Instruction(id: 15, position: (0,0), text: "If you like, you can move a finger gently, exploring this sensation.", duration: 5),
        Instruction(id: 16, position: (0,0), text: "This position is nice because you can use it anywhere, anytime.", duration: 5),
        Instruction(id: 17, position: (0,0), text: "Just give yourself a little squeeze.", duration: 5),
        Instruction(id: 18, position: (0,0), text: "What does it feel like when you support yourself, like a good friend?", duration: 5),
        Instruction(id: 19, position: (0,0), text: "Maybe gently stroking your arms or crossing your arms and giving a gentle squeeze.", duration: 5),
        Instruction(id: 20, position: (0,0), text: "Gently rubbing your chest, or using circular movements.", duration: 5),
        Instruction(id: 21, position: (0,0), text: "Cupping one hand in the other in your lap.", duration: 5),
        Instruction(id: 22, position: (0,0), text: "Bringing your two hands back together, taking a moment to hold your own tummy.", duration: 5),
        Instruction(id: 23, position: (0,0), text: "Maybe your two hands are spread out. Maybe you put one hand over the other.", duration: 5),
        Instruction(id: 24, position: (0,0), text: "You can even approach it like a little game if you like. It doesn't have to be serious.", duration: 5),
        Instruction(id: 25, position: (0,0), text: "Again, just reflecting and noticing what happens in your body when you do this.", duration: 5),
        Instruction(id: 26, position: (0,0), text: "One hand over your chest, over your heart, one hand over your tummy.", duration: 5),
        Instruction(id: 27, position: (0,0), text: "We're just noticing—how do these different forms of touch connect for you?", duration: 5),
        Instruction(id: 28, position: (0,0), text: "What happens in your nervous system, in your body, when you offer yourself a little bit of soothing, supportive touch?", duration: 5),
        Instruction(id: 29, position: (0,0), text: "I want to invite you to practice on your own, and feel free to experiment.", duration: 5),
        Instruction(id: 30, position: (0,0), text: "Use any posture or position that helps you feel calm, and let go of the rest.", duration: 5),
        Instruction(id: 31, position: (0,0), text: "Listen to what your own body tells you.", duration: 5)
    ]

}
