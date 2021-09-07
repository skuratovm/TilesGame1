//
//  ViewController.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 3.09.21.
//

import UIKit

//block of code to upgrade View Inspector

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

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
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        game.resetGame()
        touches = 0
        touchLabel.text = "Touches: 0"
        touchLabel.textColor = #colorLiteral(red: 0.6364808083, green: 0.3616332412, blue: 0.9602059722, alpha: 1)
        touchLabel.text = "Tap any tile to start!"
       
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
        if touches >= 1 && touches < 49{
            touchLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0.9928097129, alpha: 1)
        }
        if touches >= 49 && touches < 85{
            touchLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        if touches >= 85 {
            touchLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updeteViewFromModel()
        }
        
    }
    
    
}
