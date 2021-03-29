//
//  MainGameVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit

var timer  = Timer()
var secondPassed = 0



class MainGameVC: UIViewController {
    let gameModel = GameModel()
    
    //Main Game State Control Variables
    var time = 0
    var map = [0]
    var sol = [0]
    
    //  Outlets to display the time left according to the difficulty of the game
    @IBOutlet weak var timeLeftProgress: UIProgressView!
    
    
    
    //Map Input and Layout outlets
    @IBOutlet var mapInputs: [UITextField]!
    @IBOutlet var mapPoints: [UILabel]!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        var i = 0
        for point in mapPoints{
            point.text = String(map[i])
            i+=1
        }
        
        print(sol)
        
        
        time = time*60*5
        timer.invalidate()
        timeLeftProgress.progress = 0.0
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
                                        #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if(secondPassed <= time)
        {
            let percentageProgress = Float(secondPassed)/Float(time)
            timeLeftProgress.progress =  Float(percentageProgress)
            secondPassed += 1
        }
        else
        {
            timer.invalidate()
            endGame(2)
        }
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        var flag = 0
        
        var i = 0
        if sender.tag==1{
            for input in mapInputs{
                if (input.text?.rangeOfCharacter(from: NSCharacterSet.decimalDigits)) != nil {
                    if let inp = input.text{
                        if Int(inp) == sol[i]{
                            flag+=1;
                            i+=1;
                            print(flag)
                            if flag==4{
                              
                                endGame(1)
                            }else if flag==4 && i>3{
                                let errorAlert = gameModel.gameAlert("Almost There", "You Still Have Time Try Again...")
                                present(errorAlert, animated: true, completion: nil)
                            }
                        }
                    
                    }
                    
                } else {
                    let errorAlert = gameModel.gameAlert("Invalid Input", "Enter Numbers 1-9 Only")
                    present(errorAlert, animated: true, completion: nil)
                }
            }
        }else{
            endGame(2)
        }
        
    }
    
    func endGame(_ status:Int){
        var animationName = ""
        var displayText = ""
        if status==1{
            animationName = "winner"
            displayText = "勝 Winner 者"
        }
        else
        {
            animationName = "again"
            displayText = "再試 Try Again 行す"
            
        }
        let destinationVC = storyboard?.instantiateViewController(identifier: "WinnerVC") as! WinnerVC
        destinationVC.animationName = animationName
        destinationVC.pageTitle = displayText
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)    }
    
    
}
