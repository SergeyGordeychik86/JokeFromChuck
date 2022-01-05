//
//  StartSound.swift
//  JokeFromChuck
//
//  Created by MacBook on 12.07.2021.
//

import UIKit
import AVFoundation

class  StartSound {
    var audio = AVAudioPlayer()
    
    func audioKick() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "KickFace", ofType: "mp3")!))
            audio.prepareToPlay()
//            audio.play(atTime: 0.43)
            audio.play()
        } catch {
            
        }
    }

    func audioKickAndSayChack() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Kick and Say", ofType: "mp3")!))
            audio.prepareToPlay()
//            audio.play(atTime: 0.43)
            audio.play()
        } catch {
            
        }
    }
    
    func audioLikeAndSayChack() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Like and Say", ofType: "mp3")!))
            audio.prepareToPlay()
//            audio.play(atTime: 0.43)
            audio.play()
        } catch {
            
        }
    }
    func audioStart() {
        do {
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Chack Norris the guy in the hat", ofType: "mp3")!))
            audio.prepareToPlay()
            audio.play()
        } catch {
            
        }
    }
    
    func audioKickAndSayChackStop() {
        audio.stop()

   }
}
