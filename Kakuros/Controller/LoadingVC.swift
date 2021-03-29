//
//  LoadingVC.swift
//  Kakuros
//
//  Created by UTKARSH VARMA on 2021-03-29.
//

import UIKit
import Lottie
class LoadingVC: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    
    let mapManager = MapManager()

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
        
        mapManager.GetMap()
    }
    

}
