//
//  ChoseDifficultyVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit

class ChoseDifficultyVC: UIViewController {
// This variable will manage te difficulty level for the game and will be passed to the next view when we perform the segue
    
    var diffLevel = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonClicked(_ sender: UIButton) {
        let destinationVC = storyboard?.instantiateViewController(identifier: "MainGameVC") as! MainGameVC
        destinationVC.time = sender.tag
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
        
    }
    

}
