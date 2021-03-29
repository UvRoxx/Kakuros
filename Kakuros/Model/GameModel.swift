//
//  GameModel.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit


class GameModel:UIViewController{
    
    func gameAlert(_ title:String,_ message:String)->UIAlertController
    {
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        

        return alert
    }
   
    
}

