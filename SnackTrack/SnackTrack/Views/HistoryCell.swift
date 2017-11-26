//
//  HistoryCell.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var item: HistoryItem? {
        didSet {
            previewImage?.image = item?.photo
            itemName?.text = item?.item
            calorieLabel?.text = "\(item!.cal!) Cal"
        }
    }
    
    var previewImage: UIImageView? = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    var itemName: UILabel? = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var calorieLabel: UILabel? = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear

        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 18, y: 10, width: self.frame.width + 16, height: 80))
        whiteRoundedView.layer.backgroundColor = UIColor.white.cgColor
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        self.contentView.addSubview(whiteRoundedView)
        self.contentView.sendSubview(toBack: whiteRoundedView)
        self.contentView.addSubview(previewImage!)
        self.contentView.addSubview(itemName!)
        self.contentView.addSubview(calorieLabel!)
        
        self.addConstraintsWithFormat(format: "H:|-30-[v0(60)]", views: previewImage!)
        self.addConstraintsWithFormat(format: "V:|-20-[v0(60)]", views: previewImage!)
        self.addConstraintsWithFormat(format: "H:|-100-[v0(70)]", views: itemName!)
        self.addConstraint(NSLayoutConstraint(item: itemName, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 4))
        
        self.addConstraintsWithFormat(format: "H:[v0(90)]-15-|", views: calorieLabel!)
        self.addConstraint(NSLayoutConstraint(item: calorieLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 4))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
