//
//  Concentration.swift
//  Concentration
//
//  Created by Raul Jonathan Guzman Condor on 4/20/20.
//  Copyright © 2020 Raul's House. All rights reserved.
//

import Foundation

class Concentration{
    
    static let INVALID_INDEX = -1
    
    let emojies = ["😈","👺","👻","👽","🤖","👾","🧞‍♀️","🦇"]
    
    var cards = [Card]()
    var lastCardIndexFaceUp : Int = Concentration.INVALID_INDEX
    
    init(numberPairOfCards: Int = 0) {
        for index in 0 ..< numberPairOfCards {
            let card = Card(withEmoji: emojies[index])
            cards += [card,card]
        }
    }
    
    func chooseCard(at index: Int){
        
        for index in cards.indices {
            cards[index].isFaceUp = cards[index].isMatched
        }
        
        cards[index].isFaceUp = true
        
        if lastCardIndexFaceUp != Concentration.INVALID_INDEX , index != lastCardIndexFaceUp{
            
            cards[lastCardIndexFaceUp].isFaceUp = true
            
            if cards[lastCardIndexFaceUp].identifier == cards[index].identifier {
                cards[lastCardIndexFaceUp].isMatched = true
                cards[lastCardIndexFaceUp].isFaceUp = true
                cards[index].isMatched = true
            }
            
            lastCardIndexFaceUp = Concentration.INVALID_INDEX
            
        } else {
            
            lastCardIndexFaceUp = index
        }
        
    }
    
}
