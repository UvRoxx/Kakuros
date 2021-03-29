//
//  LoadingVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Lottie
class LoadingVC: UIViewController,LoadMapDelegate {
   

    @IBOutlet weak var loadingView: UIView!
    
    var time = 0
    var mapManager = MapManager()

    var animationView: AnimationView?
    var loading: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading = .init(name:"load")
        loading?.loopMode = .loop
        loading?.animationSpeed = 1
        loading?.frame = loadingView.bounds
        loading?.sizeToFit()
        loadingView.addSubview(loading!)
        loading?.play()
        
        mapManager.delegate = self
        mapManager.GetMap()
    }
    
    
    func loadMapDelegate(mapInfo: MapModel) {
        //Using Grand Central Dispatch To Manage the Netoworking call Asynchronous
        DispatchQueue.main.async {
            let destinationVC = self.storyboard?.instantiateViewController(identifier: "MainGameVC") as! MainGameVC
            destinationVC.time = self.time
            destinationVC.map = mapInfo.MAP
            destinationVC.sol = mapInfo.SOL
            destinationVC.modalPresentationStyle = .fullScreen
            self.present(destinationVC, animated: true, completion: nil)
            
            
        }
       
        
    }
    

}
