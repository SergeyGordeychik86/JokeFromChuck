//
//  StartViewController.swift
//  JokeFromChuck
//
//  Created by MacBook on 12.12.2021.
//

import UIKit
import CoreMedia

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var buttonClickAut: UIButton!
    @IBOutlet weak var buttonClickTwoAut: UIButton!
    @IBOutlet weak var imageChackTwo: UIImageView!
    
    let startSound = StartSound()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animOutOne()
        startButton.layer.cornerRadius = 35
        if startButton.isTouchInside == true {
            imageChackTwo.isHidden = true
            
        }
       
    }
    
    
    @IBAction func buttonSrartAct(_ sender: UIButton) {
        startSound.audioKickAndSayChackStop()
        startSound.audioKick()
        destination()

    }
    
  
    @IBAction func clickActOne(_ sender: UIButton) {
        startSound.audioStart()
        imageChackTwo.image = .init(imageLiteralResourceName: "2")
        buttonClickAut.isHidden = true
        buttonClickTwoAut.isHidden = false
    }
    
    
    @IBAction func clickActTwo(_ sender: UIButton) {
        imageChackTwo.image = .init(imageLiteralResourceName: "3")
        buttonClickTwoAut.isHidden = true
        startButton.isHidden = false
    }
    
    func destination() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:"ViewController") as? ViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func animOutOne() -> Bool {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.8
        
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = Float.greatestFiniteMagnitude
      startButton.layer.add(pulse, forKey: nil)
        buttonClickAut.layer.add(pulse, forKey: nil)
        buttonClickTwoAut.layer.add(pulse, forKey: nil)
        return true
    }

}
