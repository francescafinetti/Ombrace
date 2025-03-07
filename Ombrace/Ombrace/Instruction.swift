//
//  Instruction.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//
import SwiftUI

enum BodyPoint: CaseIterable {
    case leftcheek,rightcheek, leftShoulder, rightShoulder, heart, stomach , out , rightelbow, leftelbow , righthand , lefthand,rightarm,leftarm }

struct Instruction {
    var id: Int
    var bodyPoints: [BodyPoint]
    var text: String
    var duration: Double
}

