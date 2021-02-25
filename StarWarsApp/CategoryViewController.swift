//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class CategoryViewController: UICollectionViewController {

    var categories = [""]
    let image = UIImage(named: "HanSolo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch category {
        case 0:
            categories = ["Han Solo", "Darth Vader", "Luke Skywalker", "Leia Organa"]
        case 1:
            categories = ["Wookies", "Ewoks", "Twileks"]
        case 2:
            categories = ["Corvette", "Destroyer", "Millenium Falcom"]
        default:
            print("failed to request")
        }

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
        
        if lastOpenedItens.contains(categories[indexPath.row]){
            return
        }else{
            lastOpenedItens.insert(categories[indexPath.row], at: 0)
        }
        
    }

}
