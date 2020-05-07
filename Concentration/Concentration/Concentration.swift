//
//  Concentration.swift
//  Concentration
//
//  Created by Raul Jonathan Guzman Condor on 4/20/20.
//  Copyright © 2020 Raul's House. All rights reserved.
//

import Foundation

class Concentration{
    
    private static let INVALID_INDEX = -1
    private let emojiesHash : [Int: [String]] = [ 0:["😀","😃","😁","😆","😎","😝","😤","🥺"],
                                          1:["🌂","🥽","🕶","👓","🧳","🎒","💼","👜"],
                                          2:["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"],
                                          3:["🌲","🌳","🌴","🌱","🌿","☘️","🍀","🎍"],
                                          4:["🌖","🌗","🌘","🌑","🌒","🌓","🌔","🌕"],
                                          5:["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇"],
                                          6:["⚽️","🏀","🏈","⚾️","🥎","🎾","🏑","🏉"]]
    
    var cards = [Card]()
    private var lastCardIndexFaceUp : Int = Concentration.INVALID_INDEX
    private(set) var flipCount = 0
    private(set) var points = 0
    
    init(numberPairOfCards: Int = 0) {
        assert(numberPairOfCards > 0, "Number pair of cards should be positive")
        self.flipCount = 0
        self.points = 0
        
        let randomIndex = 7.randomUntil
        let emojies : [String] = emojiesHash[randomIndex]!
        
        for index in 0 ..< numberPairOfCards {
            let card = Card(withEmoji: emojies[index] )
            cards += [card,card]
        }
        
        for _ in 0 ..< numberPairOfCards{
            let first = (numberPairOfCards*2).randomUntil
            let second = (numberPairOfCards*2).randomUntil
            cards.swapAt(first,second)
        }
    }
    
    func chooseCard(at index: Int){
        
        var points = 0
        for index in cards.indices {
            cards[index].isFaceUp = cards[index].isMatched
        }
        
        cards[index].isFaceUp = true
        
        if lastCardIndexFaceUp != Concentration.INVALID_INDEX , index != lastCardIndexFaceUp{
            
            cards[lastCardIndexFaceUp].isFaceUp = true
            points = -1
            
            if cards[lastCardIndexFaceUp].identifier == cards[index].identifier {
                points = 2
                cards[lastCardIndexFaceUp].isMatched = true
                cards[lastCardIndexFaceUp].isFaceUp = true
                cards[index].isMatched = true
            }
            
            lastCardIndexFaceUp = Concentration.INVALID_INDEX
            
        } else {
            lastCardIndexFaceUp = index
        }
        
        self.points += points
        self.flipCount += 1
    }
    
}

extension Int{
    var randomUntil : Int {
        return .random(in: 0 ..< self)
    }
}
