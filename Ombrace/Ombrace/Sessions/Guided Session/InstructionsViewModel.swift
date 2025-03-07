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
        Instruction(id: 1, bodyPoints: [ .out], text: "So now, we're going to practice together", duration: 3),
        Instruction(id: 2, bodyPoints: [ .out], text: "Try to follow along", duration: 3),
        Instruction(id: 3, bodyPoints: [.rightcheek], text: "Just begin by bringing one hand up to your cheek and cradling your face in your hand.", duration: 6),
        Instruction(id: 4, bodyPoints: [.rightcheek], text: "You can close your eyes if you like, so that you can pay attention to what’s happening in your body.", duration: 5),
        Instruction(id: 5, bodyPoints: [.rightcheek ], text: "Just feel the contact of this hand.", duration: 4),
        Instruction(id: 6, bodyPoints: [.rightShoulder], text: "Move your hand down a little bit to your shoulder.", duration: 5),
        Instruction(id: 7, bodyPoints: [.rightShoulder , .leftShoulder], text: "Move your other hand and rest gently on both of your shoulders", duration: 4),
        Instruction(id: 8, bodyPoints: [.rightShoulder,.leftShoulder], text: " How does this feel?", duration: 4),
        Instruction(id: 9, bodyPoints: [.rightarm,.leftarm], text: "Slowly move your hands down on your biceps", duration: 3),
        Instruction(id: 10, bodyPoints: [.rightarm,.leftarm], text: "Just taking a moment to feel these two hands, perhaps imagining that they are caring hands, offering kindness and warmth.", duration: 5),
        Instruction(id: 11, bodyPoints: [.rightelbow,.leftelbow], text: "Move slowly and with both hands cup your elbows ", duration: 5),
        Instruction(id: 12, bodyPoints: [.rightelbow,.leftelbow], text: "If you like, you can move your thumb gently, exploring this sensation.", duration: 5),
        Instruction(id: 13, bodyPoints: [.rightelbow,.leftelbow], text: "This position is nice because you can use it anywhere, anytime.", duration: 5),
        Instruction(id: 14, bodyPoints: [.rightelbow,.leftelbow], text: "Give yourself a little squeeze.", duration: 5),
        Instruction(id: 15, bodyPoints: [.rightelbow,.leftelbow], text: "What does it feel like when you support yourself, like a good friend?", duration: 5),
        Instruction(id: 16, bodyPoints: [.righthand,.lefthand], text: "Now keep going down your arms and put your hands togheter", duration: 3),
        Instruction(id: 17, bodyPoints: [.righthand,.lefthand], text: "Give you gentle strokes", duration: 3),
        Instruction(id: 18, bodyPoints: [.heart, .stomach], text: "Now Move one hand over your heart space , and one over your tummy.", duration: 5),
        Instruction(id: 19, bodyPoints: [.heart, .stomach], text: "Focus on your heartbeat", duration: 5),
        Instruction(id: 20, bodyPoints: [.heart,.stomach], text: "What happens in your nervous system, in your body, when you offer yourself a little bit of soothing, supportive touch?", duration: 5),
        Instruction(id: 21, bodyPoints: [ .out], text: "I want to invite you to practice on your own, and feel free to experiment.", duration: 5),
        Instruction(id: 22, bodyPoints: [ .out], text: "Use any posture or position that helps you feel calm, and let go of the rest.", duration: 5),
        Instruction(id: 23, bodyPoints: [ .out], text: "Listen to what your own body tells you.", duration: 5),
        
       
    ]
}

