//
//  HowToPlayVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-04-19.
//

import UIKit

class HowToPlayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.tag == 1{
            
        }else if sender.tag == 2{
            let destinationVC = storyboard?.instantiateViewController(identifier: "WatchTutorialVC") as! WatchTutorialVC
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }else{
            let destinationVC = storyboard?.instantiateViewController(identifier: "ManageGameVC") as! ManageGameVC
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }
    }
    
}
