//
//  TomorrowTableViewCell.swift
//  GrubityIntern
//
//  Created by DUY on 10/11/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class TomorrowTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!
    let tomorrows = Tomorrow.dataFromBundles()
    override func awakeFromNib() {
        super.awakeFromNib()
        TableView.dataSource = self
        TableView.delegate = self
        // Initialization code
        TableView.layer.masksToBounds = false
        TableView.layer.shadowRadius = 10
        TableView.layer.shadowOffset = .zero
        TableView.layer.shadowColor = UIColor.black.cgColor
        TableView.layer.shadowOpacity = 0.3
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tomorrows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TomorrowCell", for: indexPath) as! TomorrowCell
        let tomorrow = tomorrows[indexPath.row]
        cell.Avatar.image = UIImage(named: tomorrow.Avatar)
        cell.Title.text = tomorrow.Title
        cell.Name.text = tomorrow.Name
        cell.Price.text = tomorrow.Price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
