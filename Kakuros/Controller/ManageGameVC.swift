//
//  ManageGameVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Firebase
class ManageGameVC: UIViewController {

    @IBOutlet var roundButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in roundButtons{
            button.layer.cornerRadius = button.bounds.size.height/2
            button.clipsToBounds = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender.tag == 1{
            let destinationVC = storyboard?.instantiateViewController(identifier: "difficultyVC") as! ChoseDifficultyVC
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }
        else if sender.tag == 2{
            let destinationVC = storyboard?.instantiateViewController(identifier: "HighScoreVC") as! HighScoreVC
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
            
        }else{
            let destinationVC = storyboard?.instantiateViewController(identifier: "HowToPlayVC") as! HowToPlayVC
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }
    
    }
    
    // Sign out function to manage user auth state
    @IBAction func signOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let destinationVC = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            let destinationVC = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            destinationVC.modalPresentationStyle = .fullScreen
            present(destinationVC, animated: true, completion: nil)
        }
    }
    
   

}
