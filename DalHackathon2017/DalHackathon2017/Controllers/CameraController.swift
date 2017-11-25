//
//  ViewController.swift
//  DalHackathon2017
//
//  Created by Mack Boudreau on 2017-11-24.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class CameraController: UIViewController {

    var camera: Camera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        camera = Camera(frame: self.view.bounds)
        self.view.addSubview(camera!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//self.view - gives
    
}

