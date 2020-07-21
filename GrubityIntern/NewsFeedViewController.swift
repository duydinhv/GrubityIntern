//
//  NewsFeedController.swift
//  GrubityIntern
//
//  Created by DUY on 9/3/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let todays = Today.dataFromBundles()
    let tomorrows = Tomorrow.dataFromBundles()
    let weekends = Weekend.dataFromBundles()
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 330, height: 20))
    @IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
        let header = UINib.init(nibName: "headerCell", bundle: Bundle.main)
        TableView.register(header, forHeaderFooterViewReuseIdentifier: "headerView")
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 2
        case 4:
            return 1
        case 5:
            return 0
        case 6:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let today = todays[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell
            cell.topAnchor.constraint(equalTo: TableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")!.bottomAnchor)
            cell.heightAnchor.constraint(equalToConstant: 315).isActive = true
            cell.View.layer.masksToBounds = false
            cell.View.layer.shadowColor = UIColor.black.cgColor
            cell.View.layer.shadowOpacity = 0.5
            cell.View.layer.shadowOffset = .zero
            cell.View.layer.shadowRadius = 5
            cell.background.image = UIImage(named: today.Background)
            cell.background.layer.masksToBounds = true
            cell.background.layer.cornerRadius = 10.0
            cell.Event.text = today.Event
            cell.Location.text = today.Location
            cell.Price.text = today.Price
            cell.time.text = today.Time
            cell.time.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            cell.time.layer.masksToBounds = true
            cell.time.layer.cornerRadius = 15
            cell.UserName.text = today.Name
            return cell
        case 1:
            let weekend = weekends[0]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell
            cell.topAnchor.constraint(equalTo: TableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")!.bottomAnchor)
            cell.heightAnchor.constraint(equalToConstant: 315).isActive = true
            cell.View.layer.masksToBounds = false
            cell.View.layer.shadowColor = UIColor.black.cgColor
            cell.View.layer.shadowOpacity = 0.5
            cell.View.layer.shadowOffset = .zero
            cell.View.layer.shadowRadius = 5
            cell.background.image = UIImage(named: weekend.Background)
            cell.background.layer.masksToBounds = true
            cell.background.layer.cornerRadius = 10.0
            cell.Event.text = weekend.Event
            cell.Location.text = weekend.Location
            cell.Price.text = weekend.Price
            cell.time.text = weekend.Time
            cell.time.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            cell.time.layer.masksToBounds = true
            cell.time.layer.cornerRadius = 15
            cell.UserName.text = weekend.Name
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CellCollectionView
            cell.heightAnchor.constraint(equalToConstant: 250).isActive = true
            return cell
            
        case 3:
            let today = todays[indexPath.row]
            let cell = TableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! CustomCell
            cell.topAnchor.constraint(equalTo: TableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")!.bottomAnchor)
            cell.heightAnchor.constraint(equalToConstant: 315).isActive = true
            cell.View.layer.masksToBounds = false
            cell.View.layer.shadowColor = UIColor.black.cgColor
            cell.View.layer.shadowOpacity = 0.5
            cell.View.layer.shadowOffset = .zero
            cell.View.layer.shadowRadius = 5
            cell.background.image = UIImage(named: today.Background)
            cell.background.layer.masksToBounds = true
            cell.background.layer.cornerRadius = 10.0
            cell.Event.text = today.Event
            cell.Location.text = today.Location
            cell.Price.text = today.Price
            cell.time.text = today.Time
            cell.time.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            cell.time.layer.masksToBounds = true
            cell.time.layer.cornerRadius = 15
            cell.UserName.text = today.Name
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TomorrowTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 463).isActive = true
            return cell
            
        case 5:
            return UITableViewCell()
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! CelebTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 237).isActive = true
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! headerView
        switch (section) {
        case 0:
            header.ImageView.isHidden = false
            header.Button.isHidden = false
            header.Status.text = "YOU HUNGRY?"
            header.Time.text = "TODAY"
            return header
            
        case 1:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.text = "CHECK IT OUT"
            header.Time.text = "This weekend"
            return header
            
        case 2:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.isHidden = true
            header.Time.text = "TOP RATED"
            return header
            
        case 3:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.text = "FRIEND'S FEEL"
            header.Time.text = "Check what your friend like?"
            return header
            
        case 4:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.text = "FOR YOU"
            header.Time.text = "Feel like trying something new?"
            return header
            
        case 5:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.text =  "DON'T SEE YOUR FAVORITE FOODS?"
            header.Time.textColor = .red
            header.Time.text = "Discover more   >"
            let attributedString = NSMutableAttributedString(string: "Dicover more   >")
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            header.Time.attributedText = attributedString
            return header
            
        case 6:
            header.ImageView.isHidden = true
            header.Button.isHidden = true
            header.Status.text = "TOP CONTRIBUTORS"
            header.Time.text = "Those who set the soul for the dishes"
            return header
            
        default:
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 130
        } else if (section == 2) {
            return 70
        } else {
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
