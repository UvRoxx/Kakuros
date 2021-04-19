//
//  HighScoreVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-04-19.
//

import UIKit

class HighScoreVC: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedScore = defaults.value(forKeyPath: "score")as?Int{
            
            scoreLabel.text = String(savedScore)
        }
        
        
        
        
    }
    
    @IBAction func resetScore(_ sender: UIButton) {
        scoreLabel.text = "0"
        defaults.setValue(0, forKey: "score")
    }
    @IBAction func homeClicked(_ sender: UIButton) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "ManageGameVC") as! ManageGameVC
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
}
