//
//  Item.swift
//  aaa
//
//  Created by Francesca Finetti on 24/02/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
