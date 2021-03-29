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

    //Main Game State Control Variables
    
    var time = 0
    var map = [0]
    var sol = [0]
    
    //  Outlets to display the time left according to the difficulty of the game
    @IBOutlet weak var timeLeftProgress: UIProgressView!
    
    
    @IBOutlet var mapPoints: [UILabel]!
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       var i = 0
        for point in mapPoints{
            point.text = String(map[i])
            i+=1
        }
        
        
        
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
      print(percentageProgress)
       }
        else
       {
        timer.invalidate()
        //action when game is over
       }
    }
    
    


}
