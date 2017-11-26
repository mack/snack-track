//
//  AddPopup.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class PopupLauncher: NSObject {
    
    let blackView = UIView()
    let contentView: UIView = {
        let view = UIView()
        let imgView = UIImageView()
        imgView.backgroundColor = UIColor(white: 0, alpha: 0.1)
        imgView.layer.cornerRadius = 5
        let addBtn = UIButton()
        addBtn.setTitle("ADD", for: UIControlState.normal)
        addBtn.backgroundColor = UIColor.rgb(red: 52, green: 219, blue: 159)
        addBtn.layer.cornerRadius = 30
        
        view.addSubview(imgView)
        view.addSubview(addBtn)
        view.addConstraintsWithFormat(format: "H:|-16-[v0(70)]", views: imgView)
        view.addConstraintsWithFormat(format: "V:|-16-[v0(70)]", views: imgView)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addBtn)
        view.addConstraintsWithFormat(format: "V:[v0(60)]-16-|", views: addBtn)
        
        
        return view
    }()
    
    @objc
    func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            window.addSubview(contentView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            contentView.backgroundColor = UIColor.white
            contentView.layer.cornerRadius = 5
            contentView.frame = CGRect(x: 35, y: 101.5, width: 305, height: 450)
            contentView.alpha = 0

            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.contentView.alpha = 1
            }, completion: nil)
            
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
        }
        
    }
    
    @objc
    func handleDismiss() {
        if let window = UIApplication.shared.keyWindow {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 0
                self.contentView.alpha = 0
            }, completion: nil)
        }
    }
    
    override init() {
        super.init()
        
    }
}
