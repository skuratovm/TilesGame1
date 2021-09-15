//
//  Card.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 6.09.21.
//

import Foundation

struct Card {
    var  isFaceUp = true
    var isMatched = false
    var identifier: Int
    
    private static var identifierNumber = 0
    private static func identifierNumberGeneration() -> Int{
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierNumberGeneration()
        
    }
}
