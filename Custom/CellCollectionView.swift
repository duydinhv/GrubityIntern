//
//  TableViewCell.swift
//  GrubityIntern
//
//  Created by DUY on 9/23/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class CellCollectionView: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let topRateds = TopRated.dataFromBundles()
    @IBOutlet weak var CollectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRateds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionViewCell
        let topRated = topRateds[indexPath.row]
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = .zero
        cell.layer.shadowRadius = 5
        cell.layer.borderWidth = 0.0
        cell.Background.image = UIImage(named: topRated.Background)
        cell.Title.text = topRated.Title
        cell.Name.text = topRated.Name
        cell.Price.text = topRated.Price
        cell.Location.text = topRated.Location
        cell.Avatar.image = UIImage(named: topRated.Avatar)
        cell.Avatar.layer.masksToBounds = false
        cell.Avatar.layer.cornerRadius = cell.Avatar.bounds.height / 2
        cell.Avatar.clipsToBounds = true
        cell.heightAnchor.constraint(equalToConstant: 215.0).isActive = true
        return cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionView.delegate = self
        CollectionView.dataSource = self
        // Initialization code
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
