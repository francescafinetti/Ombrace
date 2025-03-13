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
        Instruction(id: 1, handsposition: handposition(left: .lefthand, right: .righthand), text: "Let’s begin together, taking a moment to listen. Make sure your body feels comfortable and ready to follow the movement.", duration: 8, scale: 1.0, offset: .zero),
        Instruction(id: 2, handsposition: handposition(left: .lefthand, right: .righthand), text: "Try to follow my gestures, but remember you can go at your own pace. There’s no rush.", duration: 5, scale: 1.0, offset: .zero),
        Instruction(id: 3, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Start by gently bringing your left hand to your right cheek, as if you want to softly caress your face with your palm.", duration: 10, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 4, handsposition: handposition(left: .rightcheek, right: .righthand), text: "If you’d like, you can close your eyes to focus more on the sensations your body is experiencing.", duration: 12, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 5, handsposition: handposition(left: .rightcheek, right: .righthand), text: "Stay with the sensation of contact with your hand, without rushing. Simply notice how it makes you feel.", duration: 8, scale: 2.2, offset: CGSize(width: 0, height: 400)),
        Instruction(id: 6, handsposition: handposition(left: .rightShoulder, right: .righthand), text: "Now, slowly move your left hand to your right shoulder, as if you want to cradle yourself gently with the touch.", duration: 8, scale: 2, offset: CGSize(width: -150, height: 300)),
        Instruction(id: 7, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "Move your right hand and place it gently on your left shoulder, so that both shoulders are supported by your hands.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 8, handsposition: handposition(left: .rightShoulder, right: .leftShoulder), text: "How does this sensation feel? Stay for a moment and experience it.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 9, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Now slowly move your hands down to your biceps, letting your right and left hands slide down your arms, at your own pace.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 10, handsposition: handposition(left: .rightarm, right: .leftarm), text: "Take a moment to feel your two hands moving together, as if they are gentle hands offering warmth and care.", duration: 15, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 11, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Calmly, move both hands toward your elbows.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 12, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "If you’d like, you can gently move your thumbs, exploring the sensation of contact.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 13, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "This position is very practical, and you can use it whenever you want, anywhere, to feel supported.", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 14, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "Give yourself a little squeeze, as if you’re offering yourself a gentle hug with love.", duration: 5, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 15, handsposition: handposition(left: .rightelbow, right: .leftelbow), text: "What do you feel when you support yourself gently, just like a kind friend would?", duration: 8, scale: 1.3, offset: CGSize(width: 0, height: 10)),
        Instruction(id: 16, handsposition: handposition(left: .lefthand, right: .righthand), text: "Now, slowly move both hands down your arms, bringing them together as if you want to unite the hearts of your hands.", duration: 8, scale: 1.0, offset: .zero),
        Instruction(id: 17, handsposition: handposition(left: .lefthand, right: .righthand), text: "Make soft movements, as if you’re gently caressing yourself with tenderness.", duration: 8, scale: 1.1, offset: .zero),
        Instruction(id: 18, handsposition: handposition(left: .heart, right: .stomach), text: "Now, move your left hand over your heart and your right hand over your stomach, as if appreciating these two important spaces of your body.", duration: 8, scale: 1.5, offset: CGSize(width: 0, height: 15)),
        Instruction(id: 19, handsposition: handposition(left: .heart, right: .stomach), text: "Bring your attention to the heartbeat, letting your breath guide you.", duration: 8, scale: 1.5, offset: CGSize(width: 0, height: 150)),
        Instruction(id: 20, handsposition: handposition(left: .heart, right: .stomach), text: "What happens in your body and mind when you offer yourself a gentle touch, just like you would for a friend?", duration: 15, scale: 1.5, offset: CGSize(width: 0, height: 150)),
        Instruction(id: 21, handsposition: handposition(left: .lefthand, right: .righthand), text: "I now invite you to try on your own, exploring the movement and feeling what helps you feel better.", duration: 10, scale: 1.0, offset: CGSize(width: 0, height: 0)),
        Instruction(id: 22, handsposition: handposition(left: .lefthand, right: .righthand), text: "Use the position that makes you feel calmer and more serene, letting go of everything else.", duration: 10, scale: 1.0, offset: .zero),
        Instruction(id: 23, handsposition: handposition(left: .lefthand, right: .righthand), text: "Listen to what your body is telling you, trusting its wisdom.", duration: 8, scale: 1.0, offset: CGSize(width: 0, height: 0))
    ]
}
