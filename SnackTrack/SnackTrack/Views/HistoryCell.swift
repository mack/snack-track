//
//  HistoryCell.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var previewImage: UIImageView? = {
        let imageView = UIImageView()
        return imageView
    }()
    var itemName: UILabel? = {
        let label = UILabel()
        return label
    }()
    var calorieLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear

        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 10, width: self.frame.width, height: 40))
        whiteRoundedView.layer.backgroundColor = UIColor.white.cgColor
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        self.contentView.addSubview(whiteRoundedView)
        self.contentView.sendSubview(toBack: whiteRoundedView)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
