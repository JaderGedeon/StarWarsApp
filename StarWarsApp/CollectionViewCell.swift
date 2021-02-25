//
//  CollectionViewCell.swift
//  StarWarsApp
//
//  Created by Denys Roger on 23/02/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    func configure(with itemName: String, itemImage: UIImage){
        itemLabel.text = itemName
        itemImageView.image = itemImage
    }
}
