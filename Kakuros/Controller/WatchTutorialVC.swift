//
//  WatchTutorialVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-04-19.
//

import UIKit
import youtube_ios_player_helper

class WatchTutorialVC: UIViewController {

    
    @IBOutlet var playerView: YTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId:"4f57Xu8jGtY")
    }
    

   
    @IBAction func homeButtonClicked(_ sender: UIButton) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "ManageGameVC") as! ManageGameVC
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
}
