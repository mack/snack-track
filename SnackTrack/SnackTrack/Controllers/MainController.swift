//
//  ViewController.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController {
    
    var camera: Camera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.red
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellView")
//        camera = Camera(frame: self.view.bounds)
//        self.view.addSubview(camera!)
        
        navigationItem.title = "Camera"
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//            forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.shadowImage = [UIImage new];
//        self.navigationController.navigationBar.translucent = YES;
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath)
        print(123)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(3)
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    
    //self.view - gives
    
}

