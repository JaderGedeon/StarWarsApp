//
//  FavoritesViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 04/03/21.
//

import UIKit


class FavoritesViewController: UICollectionViewController {

    var favoriteItens: Array<StarWarsElement>! = []
    var selectedItem: StarWarsElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return favoriteItens.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: lastOpenedItens[indexPath.row].name ?? "Null", itemImage: favoriteItens[indexPath.row].image)
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "favToInfo", sender: self)
        
        selectedItem = favoriteItens[indexPath.row]
        
        if let index = lastOpenedItens.firstIndex(where: { (item) -> Bool in
            item.name == favoriteItens[indexPath.row].name
        }) {
            lastOpenedItens.remove(at: index)
        }
        lastOpenedItens.insert(favoriteItens[indexPath.row], at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InfoViewController {
            let vc = segue.destination as? InfoViewController
            
            vc?.itemCategory = selectedItem.category
            vc?.itemID = selectedItem.apiID!
            vc?.selectedName = selectedItem.name ?? "Null"
            vc?.selectedImage = selectedItem.image
        }
    }
}
