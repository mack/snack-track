//
//  History.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class HistoryItem: NSObject {
    var item: String?
    var photo: UIImage?
    var cal: String?
}

class History: UIView, UITableViewDelegate, UITableViewDataSource {
    var items: [HistoryItem] = {
        var item1 = HistoryItem()
        item1.item = "Pizza"
        item1.cal = "250"
        item1.photo = UIImage(named: "Pizza")
        
        var item2 = HistoryItem()
        item2.item = "Salad"
        item2.cal = "152"
        item2.photo = UIImage(named: "Salad")
        
        var item3 = HistoryItem()
        item3.item = "Buritto"
        item3.cal = "206"
        item3.photo = UIImage(named: "Buritto")
        
        var item4 = HistoryItem()
        item4.item = "Pasta"
        item4.cal = "145"
        item4.photo = UIImage(named: "Pasta")
        
        return [item1, item2, item3, item4]
    }()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HistoryCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    lazy var historyTable: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = HistoryHeader(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 200))
        return tableView
    }()
    
    private func setupTableView() {
        historyTable.register(HistoryCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(historyTable)
        self.addConstraintsWithFormat(format: "V:|[v0]|", views: historyTable)
        self.addConstraintsWithFormat(format: "H:|[v0]|", views: historyTable)
        self.backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 254)
        setupTableView()
        // r - 52 g - 219 b - 159
        // r - 52 g - 219 b - 159 a - 59 blur - 14
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
