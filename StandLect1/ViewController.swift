//
//  ViewController.swift
//  TilesGame
//
//  Created by Mikhail Skuratov on 3.09.21.
//

import UIKit
import AudioToolbox

extension Int{
    var arc4randomExtension: Int{
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}




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
    
  private lazy var game = GameLogic(numberOfPairs: numberOfPairs)
    
    var numberOfPairs: Int{
        buttonCollection.count + 1 / 2
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioServicesPlaySystemSound(1519)
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let button2 = continueButtonCollection[0]
        button2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        button2.setTitle("", for: .normal)
        

    }
    private(set) var touches = 0{
        didSet{
            touchLabel.text = "Touches : \(touches)"

        }
    }
    

   private var emojiCollection = ["🐶","🐸","🦁","🦑","🦈","🐆","🦧","🦜","🐓","🐲","🐁","🐿","🐝","🪱","🐛","🦋","🐞","🐜","🪲","🐥","🐰","🦭","🦦"]
    
   private var emojiDictionary = [Card: String]()
    
    private func emojiID(for card: Card) -> String{
        if emojiDictionary[card] == nil {
            
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        
        return emojiDictionary[card] ?? "?"
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        game.resetGame()
        touches = 0
        touchLabel.text = "Touches: 0"
        touchLabel.textColor = #colorLiteral(red: 0.6364808083, green: 0.3616332412, blue: 0.9602059722, alpha: 1)
        touchLabel.text = "Tap any tile to start!"
        
        let blurEffect = UIBlurEffect(style: .light)
         let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
         blurVisualEffectView.frame = view.bounds

//        let alertController = UIAlertController.init(title: "Title", message: "Message", preferredStyle: .alert)
//
//        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
//             print("Handle Ok logic here")
//             blurVisualEffectView.removeFromSuperview()
//         }))
//
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//             print("Handle Cancel Logic here")
             //blurVisualEffectView.removeFromSuperview()
//         }))
        
        UIView.animate(withDuration: 1.0) {
            blurVisualEffectView.frame = CGRect(x: 185, y: 350, width: 50, height: 50)
        }
         self.view.addSubview(blurVisualEffectView)
        //self.present(alertController, animated: true, completion: nil)
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
            blurVisualEffectView.removeFromSuperview()
        }
        let button2 = continueButtonCollection[0]
        button2.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0)
        button2.setTitle("", for: .normal)
//
    }
    
    func updateContinueButton(){
       let  button4 = continueButtonCollection[0]
        
        button4.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0)
        button4.setTitle("", for: .normal)
        
        
        
        
       
    }
    
   

    func updeteViewFromModel(){
        
            
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                
                button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
                button.layer.cornerRadius = 10
                let seconds = 0.2
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds ) {
                    
                
                    button.setTitle(self.emojiID(for: card), for: .normal)

                }
              
                
                
            } else{
                button.layer.cornerRadius = 10
                button.setTitle("", for: .normal)
                button.borderWidth = 0.5
                button.borderColor = #colorLiteral(red: 0.2471399903, green: 0.3659403324, blue: 0.3792953789, alpha: 1)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                
            }
        }
    }
    @IBOutlet private weak var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBOutlet private var continueButtonCollection: [UIButton]!
    
    
    
   
    @IBAction func helpButtonAction(_ sender: UIButton) {
        touchLabel.text = "Tap any tile to face up all cards"
       game.openAll()
        let seconds = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            
            self.game.closeAll()
        }
        let  button2 = continueButtonCollection[0]
        button2.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button2.setTitle("Continue", for: .normal)
        
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        updateContinueButton()
        let button3 = continueButtonCollection[0]
        button3.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0)
        button3.setTitle("", for: .normal)
        //game.closeAll()
        
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1519)//(SystemSoundID(kSystemSoundID_Vibrate))
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

