//
//  ViewController.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit

class ViewController: UIViewController {
//This is the array linking both the on screen buttons so we can make them round
    
    @IBOutlet var roundButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //This loop will set all the buttons round for better UI
        for button in roundButtons{
            button.layer.cornerRadius = button.bounds.size.height/2
            button.clipsToBounds = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true

    }
    // Function to manage the segue to next view once the user clicks a button
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.tag == 1{
            navigationController?.isNavigationBarHidden = false
            performSegue(withIdentifier: "gotoLogin", sender: self)
        }else{
            navigationController?.isNavigationBarHidden = false
            performSegue(withIdentifier: "gotoSignup", sender: self)
        }
    }
    
}

