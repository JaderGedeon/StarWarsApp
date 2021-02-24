//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class CategoryViewController: UICollectionViewController {

    let categories: [String] = ["1", "2", "3", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
    let image = UIImage(named: "HanSolo")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: categories[indexPath.row], itemImage: image!)
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selecionado: \(categories[indexPath.row])")
    }

}
