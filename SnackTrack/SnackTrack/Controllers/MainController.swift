//
//  ViewController.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var camera: Camera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = UIColor.red
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellView")
        self.collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        navigationItem.title = "Camera"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.contentInset = UIEdgeInsetsMake(-65, 0, 0, 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath)
        if (indexPath.row == 0) {
            camera = Camera(frame: cell.bounds)
            cell.addSubview(camera!)
        }
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(3)
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

