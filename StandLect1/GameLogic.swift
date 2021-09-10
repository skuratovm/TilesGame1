//
//  GameLogic.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 6.09.21.
//

import Foundation

class GameLogic {
    var cards = [Card]()
    var onlyOneFaceUpCardIndex: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = onlyOneFaceUpCardIndex, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                onlyOneFaceUpCardIndex = nil
            }else{
                for flipDown in cards.indices{
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                onlyOneFaceUpCardIndex = index
            }
        }
        
        
        
    }
    
    func openAll(){
        for i in cards.indices{
            cards[i].isFaceUp = true
            cards[i].isMatched = true
            
            
        }
    }
    
    func closeAll(){
        for i in cards.indices{
            cards[i].isFaceUp = false
            cards[i].isMatched = false
            
            
            
        }
    }
    
    func resetGame(){
        
        for i in cards.indices{
            cards[i].isFaceUp = false
            cards[i].isMatched = false
           cards[i].identifier = 0
            cards[i].identifier = Int(arc4random_uniform(12))
            
            
            
            
        }
        
    }
    
    init(numberOfPairs: Int){
        for _ in stride(from: 1, to: numberOfPairs,by: 1){
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
