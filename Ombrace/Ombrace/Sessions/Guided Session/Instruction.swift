//
//  Instruction.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//
import SwiftUI

enum BodyPoint: CaseIterable {
    case leftcheek,rightcheek, leftShoulder, rightShoulder, heart, stomach  , rightelbow, leftelbow , righthand , lefthand,rightarm,leftarm }

struct Instruction {
    var id: Int
    var handsposition: handposition
    var text: String
    var duration: Double
    var scale: CGFloat
    var offset: CGSize
}

struct handposition {
    var left: BodyPoint
    var right: BodyPoint
    
}
