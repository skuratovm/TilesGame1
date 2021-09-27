//
//  GameLogic.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 6.09.21.
//

import Foundation

class GameLogic {
    private(set) var cards = [Card]()
   private var onlyOneFaceUpCardIndex: Int? {
        get{
            
            let faceUpCardIndex = cards.indices.filter {cards[$0].isFaceUp }
            return faceUpCardIndex.count == 1 ? faceUpCardIndex.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices{
//                if cards[index].isFaceUp {
//                    if foundIndex == nil{
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = onlyOneFaceUpCardIndex, matchingIndex != index{
                if cards[matchingIndex] == cards[index]{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            }else{
                 
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
            
            
            
            
        }
    }
    
    
    func continueGame(){
        for i in cards.indices{
            if cards[i].isFaceUp {
                cards[i].isFaceUp = false
            }
        }
    }
    
    func resetGame(){
        
        for i in cards.indices{
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.cards[i].isFaceUp = false
                self.cards[i].isMatched = false
                         // cards[i].identifier = 0
              
                self.onlyOneFaceUpCardIndex = nil
               
            }
           
            
            
            
        }
        
    }
    
    init(numberOfPairs: Int){
        assert(numberOfPairs > 0,"numberOfPairs must be 1 at least")
        for _ in stride(from: 1, to: numberOfPairs,by: 1){
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
