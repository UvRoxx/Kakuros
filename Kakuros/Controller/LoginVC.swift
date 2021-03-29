//
//  LoginVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func loginPressed(_ sender: Any) {
    
        if let email = emailInput.text, let password = passwordInput.text{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                }else{
                    self.performSegue(withIdentifier: "LoginToPlay", sender: self)
                }
               
        }
      
        }
    }
    

}
