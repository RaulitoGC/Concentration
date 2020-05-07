//
//  Card.swift
//  Concentration
//
//  Created by Raul Jonathan Guzman Condor on 4/20/20.
//  Copyright © 2020 Raul's House. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var emoji : String
    private(set) var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(withEmoji emoji: String) {
        self.identifier = Card.getUniqueIdentifier()
        self.emoji = emoji
    }
}
