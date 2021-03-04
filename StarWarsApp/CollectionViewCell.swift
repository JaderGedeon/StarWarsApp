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
        itemLabel.adjustsFontForContentSizeCategory = true
        itemLabel.text = itemName
        itemImageView.image = itemImage
        if itemName == "C-3PO" {
            itemLabel.accessibilityLabel = "c3,p,o"
        }else{
            itemLabel.accessibilityLabel = itemName
        }
        
        
    }
}
