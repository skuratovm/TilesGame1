//
//  Card.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 6.09.21.
//

import Foundation

struct Card {
    var  isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    static func identifierNumberGeneration() -> Int{
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierNumberGeneration()
        
    }
}
