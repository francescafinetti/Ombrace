//
//  Instruction.swift
//  challenge5
//
//  Created by Serena Pia Capasso on 05/03/25.
//
import SwiftUI

enum BodyPoint: CaseIterable {
    case head, leftShoulder, rightShoulder, heart, stomach , out }

struct Instruction {
    var id: Int
    var bodyPoint: BodyPoint
    var text: String
    var duration: Double
}

