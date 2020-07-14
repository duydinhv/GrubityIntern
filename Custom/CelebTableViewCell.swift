//
//  CelebTableViewCell.swift
//  GrubityIntern
//
//  Created by DUY on 10/14/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class CelebTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    let name = ["Candy .L", "Syndra .J", "Candy .J"]
    let avatar = ["avatar1", "avatar2", "avatar3"]
    let follows = ["22.4k Followers", "25k Followers", "30k Followers"]
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionView.dataSource = self
        CollectionView.delegate = self
        // Initialization code
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CelebCollectionViewCell
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.5
        cell.Avatar.image = UIImage(named: avatar[indexPath.row])
        cell.Avatar.layer.masksToBounds = false
        cell.Avatar.layer.cornerRadius = cell.Avatar.bounds.height / 2
        cell.Name.text = name[indexPath.row]
        cell.Name.lineBreakMode = .byWordWrapping
        cell.Name.numberOfLines = 0
        cell.Follows.text = follows[indexPath.row]
        cell.heightAnchor.constraint(equalToConstant: 234).isActive = true
        return cell
    }
    
    
}
