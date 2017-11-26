//
//  HistoryHeader.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class HistoryHeader: UIView {
    
    var current: UILabel? = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 70, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.text = "1,230"
        return label
    }()
    
    var total: UILabel? = {
        let label = UILabel()
        label.textAlignment = .center
        label.alpha = 0.7
        label.text = "49.2% of 2,500"
        return label
    }()
    
    var cellInfoLeft: UILabel? = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "History"
        return label
    }()
    
    var cellInfoRight: UILabel? = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Total: 1,230 cal"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        current?.frame = CGRect(x: 0, y: 40, width: self.frame.width, height: 80)
        total?.frame = CGRect(x: 0, y: 95, width: self.frame.width, height: 80)
        
        self.addSubview(current!)
        self.addSubview(total!)
        self.addSubview(cellInfoLeft!)
        self.addSubview(cellInfoRight!)
        self.addConstraintsWithFormat(format: "H:|-20-[v0(70)]", views: cellInfoLeft!)
        self.addConstraintsWithFormat(format: "H:[v0(200)]-20-|", views: cellInfoRight!)
        self.addConstraintsWithFormat(format: "V:[v0(30)]|", views: cellInfoLeft!)
        self.addConstraintsWithFormat(format: "V:[v0(30)]|", views: cellInfoRight!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
