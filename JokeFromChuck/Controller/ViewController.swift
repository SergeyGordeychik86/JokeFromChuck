//
//  ViewController.swift
//  JokeFromChuck
//
//  Created by MacBook on 31.10.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   let synth = AVSpeechSynthesizer()

    @IBOutlet weak var imageChackDontSmile: UIImageView!
    @IBOutlet weak var pngChackFingal5: UIImageView!
    
    @IBOutlet weak var imageRingOut: UIImageView!
    
    
    @IBOutlet weak var imageKickChackOut: UIImageView!
    @IBOutlet weak var labelJoke: UILabel!

    @IBOutlet weak var imageChacSmile: UIImageView!
    

    @IBOutlet weak var imageChackHat: UIImageView!
    
    @IBOutlet weak var labelPointEraseGrin: UILabel!
    @IBOutlet weak var labelPointPraise: UILabel!
    
    
    @IBOutlet weak var buttonJokeOut: UIButton!
    
    @IBOutlet weak var buttonActFaceChackOut: UIButton!
    
    @IBOutlet weak var buttonPraseChack: UIButton!
    

    @IBOutlet weak var buttonClearOut: UIButton!
    
    var networkManager = NetworkManager()
    var jokeTranslate = Joke()
    var pointsPrise = 0
    var pointsEraseGrin = 0
    let startSound = StartSound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonActFaceChackOut.layer.cornerRadius = 10
        buttonPraseChack.layer.cornerRadius = 10
      
    }
    
    @IBAction func eraseThatGrin(_ sender: UIButton) {
       
    }
    
    
    @IBAction func eraseThatGrinAct(_ sender: UIButton) {
        startSound.audioKickAndSayChack()
        
        imageRingOut.isHidden = true
       buttonPraseChack.isEnabled = false
        imageChackDontSmile.isHidden = false
        self.labelJoke.text = "Согласен неудачная шутка, давай нажмём следующую"
        labelJoke.textColor = .systemRed
        labelJoke.font = UIFont.systemFont(ofSize: 25)
        
        animationKickChack()
        hiddenKickChack()
        actionImageFaceChack()
        
        if buttonActFaceChackOut.isEnabled == true {
            labelPointEraseGrin.text = "\(pointsEraseGrin + 1)"
            pointsEraseGrin += 1
        }
        destinationByChack()
        autoResetResultKick()
        
    }
    
    
    @IBAction func buttonClearPoints(_ sender: UIButton) {
        imageChacSmile.isHidden = true
        imageChackDontSmile.isHidden = false
        imageRingOut.isHidden = false
        pointsPrise = 0
        pointsEraseGrin = 0
        labelPointEraseGrin.text = "0"
        labelJoke.text = "Push \("Next Joke")"
        labelJoke.textColor = .blue
        if buttonClearOut.isEnabled == true {
        labelPointPraise.text = "0"
            buttonPraseChack.isEnabled = false
            buttonActFaceChackOut.isEnabled = false
        }
        buttonJokeOut.isEnabled = true
        startAnimate()
        
    }
    
    
    @IBAction func praiseChuckAct(_ sender: UIButton) {
        
        imageRingOut.isHidden = true
        labelJoke.textColor = .green
//        labelJoke.shadowColor = .black
        labelJoke.font = UIFont.systemFont(ofSize: 25)
        buttonActFaceChackOut.isEnabled = false
        hiddenChackHat()
        labelJoke.text = "О да, я рад, что вам понравилось, давай нажмём следующую шутку"
        if buttonPraseChack.isEnabled == true {
            
            labelPointPraise.text = "\(pointsPrise + 1)"
            pointsPrise +=  1

        }
        animationPraseChack ()
        autoResetResultKick()
        destinationGoodLuckChack()
        startSound.audioLikeAndSayChack()
        startAnimate()
    }
    
    @IBAction func translateJokeRus(_ sender: UIButton) {
        
        translateOne()
        translateTwo()
        let string = labelJoke.text
        let utterance = AVSpeechUtterance(string: (string)!)

        utterance.voice = AVSpeechSynthesisVoice(language: "ru-Ru")
//        utterance.rate = 0.3
        synth.speak(utterance)
//        if labelJoke.text?.isEmpty == false {
//            elseChuckNorrisSay()
//        }
     
    }
    
    
    @IBAction func pushRefreshButtonAction(_ sender: Any) {
        
        
        startSound.audioKickAndSayChackStop()
        stopAnimate()
        imageRingOut.isHidden = false
        imageRingOut.alpha = 0.25
        labelJoke.textColor = .black
        labelJoke.font = UIFont.boldSystemFont(ofSize: 20)
        buttonPraseChack.isEnabled = true
        buttonActFaceChackOut.isEnabled = true
        imageChacSmile.isHidden = false
        imageKickChackOut.isHidden = true
        pngChackFingal5.isHidden = true
        imageChackHat.isHidden = true
        
        if buttonJokeOut.isEnabled {
            imageChackDontSmile.isHidden = true
        }
         
        networkManager.getRandomJoke { (jokeText) in
            self.labelJoke.text = jokeText
        }
        let string = labelJoke.text
        let utterance = AVSpeechUtterance(string: (string)!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-gb")
        utterance.rate = 0.4
//        utterance.pitchMultiplier = 0.0
        synth.speak(utterance)
    }
    
    @IBAction func pushShareAction(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [labelJoke.text!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    
    
    
    
    

    func animationKickChack() {

        UIImageView.animate(withDuration: 0.3,
                            delay: 0,
                           options: [ .curveLinear],
                           animations: {
                               
                            
                               self.imageKickChackOut.frame.origin.x = -3
//                               self.imageChackDontSmile.isHidden = false
                           })
        
   }
    func animationPraseChack() {
        UIImageView.animate(withDuration: 0.2,
                            delay: 0.1,
                            options: [ .curveLinear, .transitionFlipFromTop],
                           animations: {
                               
                            
                           self.imageChackHat.frame.origin.y = 5
                            

                           })
        
   }
    // images IsHidden
    func hiddenKickChack () {
        imageKickChackOut.isHidden = false
       
    }
    func hiddenChackHat () {
        imageChackHat.isHidden = false
    }
    
    // destination
    func destinationByChack()  {
//        if self.labelPointPraise.text == "11" || self.labelPointEraseGrin.text == "11" {
//            performSegue(withIdentifier: "goVC", sender: nil)
            
//        }
        if self.labelPointEraseGrin.text == "10" {
            startSound.audioKickAndSayChackStop()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let byChackVC = storyboard.instantiateViewController(withIdentifier: "vc") as! ByChackVC
        self.present(byChackVC, animated: true, completion: nil)
    }
}
    
    func destinationGoodLuckChack() {
        if self.labelPointPraise.text == "10" {
            startSound.audioKickAndSayChackStop()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let goodLuckChackVC = storyboard.instantiateViewController(withIdentifier: "vcg") as! GoodLuckChackVC
        self.present(goodLuckChackVC, animated: true, completion: nil)
    }
}
    
    
    func actionImageFaceChack () {
        if buttonActFaceChackOut.isEnabled {
            pngChackFingal5.isHidden = false
     }
}
    
    
    
    func autoResetResultKick() {
        if labelPointEraseGrin.text == "10" || labelPointPraise.text == "10" {
            pointsEraseGrin = 0
            pointsPrise = 0
            labelJoke.text = "Push Clear"
            labelJoke.textColor = .white
            imageChackDontSmile.isHidden = false
            imageChacSmile.isHidden = true
            pngChackFingal5.isHidden = true
            imageKickChackOut.isHidden = true
            buttonActFaceChackOut.isEnabled = false
            buttonPraseChack.isEnabled = false
            buttonJokeOut.isEnabled = false
            
            
        }
    }
    func startAnimate() -> Bool {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.8
        
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = Float.greatestFiniteMagnitude
     buttonJokeOut.layer.add(pulse, forKey: nil)
        return true
    }
    
    func stopAnimate() -> Bool {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 1
        pulse.fromValue = 1
        
        pulse.toValue = 0
        pulse.autoreverses = false
//        pulse.repeatCount = Float.greatestFiniteMagnitude
     buttonJokeOut.layer.add(pulse, forKey: nil)
        return true
    }
    
//    func elseChuckNorrisSay() {
//        labelJoke.text = "Извините, но на данный момент, я не могу перевести эту Шутку. Нажмите пожалуйста следующую. "
//    }
}


