//
//  Card.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 6.09.21.
//

import Foundation

struct Card : Hashable{
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs:Card,rhs:Card) -> Bool{
        return (lhs.identifier == rhs.identifier)
    }
    var  isFaceUp = true
    var isMatched = false
    private var identifier: Int
    
    private static var identifierNumber = 0
    private static func identifierNumberGeneration() -> Int{
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierNumberGeneration()
        
    }
}
