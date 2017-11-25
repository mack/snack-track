//
//  History.swift
//  SnackTrack
//
//  Created by Mack Boudreau on 2017-11-25.
//  Copyright © 2017 Mack Boudreau. All rights reserved.
//

import UIKit

class History: UIView, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    lazy var historyTable: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.blue
        return tableView
    }()
    
    private func setupTableView() {
        historyTable.register(HistoryCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(historyTable)
        self.addConstraintsWithFormat(format: "V:[v0(400)]|", views: historyTable)
        self.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: historyTable)
        self.backgroundColor = UIColor.rgb(red: 247, green: 250, blue: 254)
        setupTableView()
        // r - 52 g - 219 b - 159
        // r - 52 g - 219 b - 159 a - 59 blur - 14
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
