//
//  HistoricViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class HistoricViewController: UICollectionViewController {


    let lastOpenedItens: [String] = [""]
    let image = UIImage(named: "HanSolo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return lastOpenedItens.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: lastOpenedItens[indexPath.row], itemImage: image!)
            print(lastOpenedItens[indexPath.row])
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

    
