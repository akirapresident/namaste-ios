//
//  VideoViewController.swift
//  namaste
//
//  Created by akira tsukamoto on 02/05/21.
//

import UIKit
import AVKit
import XCDYouTubeKit

class VideoViewController: UIViewController {
    
    @IBOutlet weak var playerViewContainer: UIView!
    
    let playerViewController = AVPlayerViewController()
    
    var videoId = "OuCvUDVoX3M"
    
    override func viewWillAppear(_ animated: Bool) {
        
        XCDYouTubeClient.default().getVideoWithIdentifier(videoId, completionHandler: { [self] video, error in
            if let video = video {
                AVPlayerViewControllerManager.shared.video = video
                let playerViewController = AVPlayerViewControllerManager.shared.controller
                playerViewController.allowsPictureInPicturePlayback = false
                playerViewController.view.frame = playerViewContainer.bounds
                addChild(playerViewController)
                if let view = playerViewController.view {
                    playerViewContainer.addSubview(view)
                }
                playerViewController.didMove(toParent: self)
            } else {
                print(error!)
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Stop playing the video when you go back
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AVPlayerViewControllerManager.shared.controller.player?.play()
    }
    
}
