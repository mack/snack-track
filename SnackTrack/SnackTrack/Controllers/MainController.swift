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
        navigationItem.title = "Camera"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellView")
        self.collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)

        setupCollectionView()
    }
    
    private func setupCollectionView() {
        if let layout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.bounces = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
    }
    
    private func setupCamera() {
        
    }
    
    private func setupHistory() {
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellView", for: indexPath)
        if (indexPath.row == 0) {
            setupCamera()
            camera = Camera(frame: cell.bounds)
            cell.addSubview(camera!)
        } else {
            setupHistory()
            cell.addSubview(History(frame: cell.bounds))
        }
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        if (offset >= self.view.frame.width) {
            navigationItem.title = "Overview"
        } else {
            navigationItem.title = "Camera"
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(3)
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

