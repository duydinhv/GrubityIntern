//
//  SearchTableView.swift
//  GrubityIntern
//
//  Created by DUY on 10/9/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class SearchTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var TableView = UITableView()
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        TableView.dataSource = self
        TableView.delegate = self
        
        let Cell = UINib(nibName: "TomorrowTableView", bundle: Bundle.main)
        TableView.register(Cell, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        TableView = UITableView(frame: CGRect(x: 0, y: 0, width: 351.5, height: 79))
        TableView.layer.backgroundColor = UIColor.white.cgColor
        self.addSubview(TableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}
