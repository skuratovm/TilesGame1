//
//  ViewController.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 3.09.21.
//

import UIKit

class ViewController: UIViewController {
   lazy var game = GameLogic(numberOfPairs: buttonCollection.count + 1 / 2)
    
  
    
  
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
       
    }
    var touches = 0{
        didSet{
            touchLabel.text = "Touches : \(touches)"

        }
    }
    
   
        
    
    
        
        //let buttonIndex1 = buttonCollection.
//        if emojiCollection[0] == emojiCollection [2] && touches % 2 == 0{
//            self.view.backgroundColor = UIColor.green
//            resultLabel.text = "That's right !"
//
//        }else if emojiCollection[0] == emojiCollection [1] && touches % 2 == 0{
//            self.view.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
//            resultLabel.text = "Try again ☹️"
//        }
    
    
    
    
    
    
    var emojiCollection = ["🐶","🐸","🦁","🦑","🦈","🐆","🦧","🦜","🐓","🐲","🐁","🐿","🐝","🪱","🐛","🦋","🐞","🐜","🪲","🐥","🐰","🦭","🦦"]
    
    var emojiDictionary = [Int: String]()
    
    func emojiID(for card: Card) -> String{
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "?"
    }
    

    func updeteViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiID(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
                button.layer.cornerRadius = 10
                
            } else{
                button.layer.cornerRadius = 10
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                
            }
        }
    }
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
   
    
   
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updeteViewFromModel()
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        touches = 0
        touchLabel.text = "Touches: \(touches)"
        
       
    }
    
}

