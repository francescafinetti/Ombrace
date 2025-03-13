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
        Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "So now, we're going to practice together", duration: 8, scale: 1.0, offset: .zero),
        Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Try to follow along", duration: 5, scale: 1.0, offset: .zero),
        Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Just begin by bringing your left hand up to your cheek and cradling your face in your hand.", duration: 6, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "You can close your eyes if you like, so that you can pay attention to what’s happening in your body.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Just feel the contact of this hand.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Move your hand down a little bit to your shoulder.", duration: 8, scale: 2, offset: CGSize(width: -150, height: 300)),
        Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Move your other hand and rest gently on both of your shoulders", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "How does this feel?", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Slowly move your hands down on your biceps", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Just taking a moment to feel these two hands, perhaps imagining that they are caring hands, offering kindness and warmth.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Move slowly and with both hands cup your elbows", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "If you like, you can move your thumb gently, exploring this sensation.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "This position is nice because you can use it anywhere, anytime.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Give yourself a little squeeze.", duration: 5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 15, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "What does it feel like when you support yourself, like a good friend?", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Now keep going down your arms and put your hands together", duration: 8, scale: 1.0, offset: .zero),
        Instruction(id: 17, handsposition: handposition(left: .lefthand, right: .righthand), text: "Give yourself gentle strokes", duration: 8, scale: 1.1, offset: .zero),
        Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Now move one hand over your heart space, and one over your tummy.", duration: 8, scale: 1.5, offset: CGSize(width: 0, height: 15)),
        Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Focus on your heartbeat", duration: 8, scale: 1.5, offset: CGSize(width: 0, height: 150)),
        Instruction(id: 20, handsposition: handposition(left: .heart, right: .stomach), text: "What happens in your nervous system, in your body, when you offer yourself a little bit of soothing, supportive touch?", duration: 8, scale: 1.5, offset: CGSize(width: 0, height: 150)),
        Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "I want to invite you to practice on your own, and feel free to experiment.", duration: 8, scale: 1.0, offset: CGSize(width: 0, height: 0)),
        Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Use any posture or position that helps you feel calm, and let go of the rest.", duration: 8, scale: 1.0, offset: .zero),
        Instruction(id: 23, handsposition: handposition(left: .lefthand, right: .righthand), text: "Listen to what your own body tells you.", duration: 8, scale: 1.0, offset: CGSize(width: 0, height: 0))
    ]
}
