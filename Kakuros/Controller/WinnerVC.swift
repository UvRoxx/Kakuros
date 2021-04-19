//
//  WinnerVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Lottie
class WinnerVC: UIViewController {

    @IBOutlet weak var winnerAnimation: UIView!
    
    @IBOutlet weak var pageHeadline: UILabel!
    var animationName = ""
    var pageTitle = ""
    var score = 0
    let defaults = UserDefaults.standard
    @IBOutlet weak var userScore: UILabel!
    var animationView: AnimationView?
    var loading: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        pageHeadline.text = pageTitle
        userScore.text = "Score:\(score)"
        
        loading = .init(name:animationName)
        loading?.loopMode = .loop
        loading?.animationSpeed = 1
        loading?.frame = winnerAnimation.bounds
        loading?.sizeToFit()
        winnerAnimation.addSubview(loading!)
        loading?.play()
        setScore()
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "ManageGameVC") as! ManageGameVC
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
    func setScore(){
        if let savedScore = defaults.value(forKeyPath: "score")as?Int{
            
            if savedScore<score{
                defaults.setValue(score, forKey: "score")
            }

        }else{
            defaults.setValue(score, forKey: "score")

        }
        
    }
    
}
