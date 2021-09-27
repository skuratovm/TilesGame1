//
//  SwiftHomeViewController.swift
//  StandLect1
//
//  Created by Mikhail Skuratov on 22.09.21.
//

import UIKit

class SwiftHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        startButtonOutlet.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        startButtonOutlet.setTitleColor(.black, for: .normal)
        
    
        
        startButtonOutlet.layer.cornerRadius = 15
        startButtonOutlet.borderWidth = 1
        startButtonOutlet.borderColor =  #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        startButtonOutlet.setTitle("Start game!", for: .normal)
        
    }
    
    private func homeBlurEffect(){
        let homeBlurEffect = UIBlurEffect(style: .light)
        let homeBlurEffectView = UIVisualEffectView(effect: homeBlurEffect)
        homeBlurEffectView.frame = startButtonOutlet.bounds
        
    }
    
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    @IBAction func startGame(_ sender: UIButton) {
//        box.cheetah
//                    .scale(1.5)
//                    .duration(1.0)
//                    .spring()
//                    .cornerRadius(20.0)
//                    .wait()
//
//            //reset
//                    .scale(1.0)
//                    .cornerRadius(0.0)
//                    .duration(0.5)
//
//                    .run()
        homeBlurEffect()
    
        
    }
    
    
}
    


