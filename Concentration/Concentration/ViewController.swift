//
//  ViewController.swift
//  Concentration
//
//  Created by Raul Jonathan Guzman Condor on 4/10/20.
//  Copyright © 2020 Raul's House. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var game = Concentration()
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUi()
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    
    @IBAction func onStartNewGame(_ sender: UIButton) {
        initUi()
        updateViewFromModel()
    }
    
    func initUi(){
        game = Concentration(numberPairOfCards: cardButtons.count/2)
    }
    
    
    private func updateViewFromModel(){
        scoreLabel.text = "Score: \(game.points)"
        flipCountLabel.text = "Flips: \(game.flipCount)"
        
        for index in 0 ..< cardButtons.count {
            let card = game.cards[index]
            let button = cardButtons[index]
            if card.isFaceUp {
                button.setTitle(card.emoji, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
}

