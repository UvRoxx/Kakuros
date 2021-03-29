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
    @IBAction func signOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
   

}
