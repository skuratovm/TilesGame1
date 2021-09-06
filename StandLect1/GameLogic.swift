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
    
    init(numberOfPairs: Int){
        for _ in stride(from: 1, to: numberOfPairs,by: 2){
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
