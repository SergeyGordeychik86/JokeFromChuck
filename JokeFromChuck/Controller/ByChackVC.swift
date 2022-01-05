//
//  ByChackVC.swift
//  JokeFromChuck
//
//  Created by MacBook on 27.06.2021.
//
import AVKit
import AVFoundation
import UIKit

class ByChackVC: UIViewController {

    @IBOutlet weak var imageVideo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "VideoByChack", ofType: "m4v")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect
//       layer.videoGravity = .resize
        view.layer.addSublayer(layer)
      player.play()
    }

}
