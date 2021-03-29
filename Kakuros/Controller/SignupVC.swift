//
//  SignupVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Firebase
class SignupVC: UIViewController {

    @IBOutlet weak var emainInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let password = passwordInput.text,let email = emainInput.text{
            
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in if let e = error{
                    print(e.localizedDescription)
                }else{
                    print("success")
                    self.performSegue(withIdentifier: "SignupToPlay", sender: self)
                }}
        }
    }
    
    
}
