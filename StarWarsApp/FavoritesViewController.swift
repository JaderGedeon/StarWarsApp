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
    var swList = StarWarsList()
    var api = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView.reloadData()
        
        favoriteItens = []
        
        let items = api.requestDB.loadAllItems()
        
        for nameInDB in items {
        
            favoriteItens.append(contentsOf: swList.list.filter { $0.name == nameInDB})
            
        }
        
        self.collectionView.reloadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return favoriteItens.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: favoriteItens[indexPath.row].name!, itemImage: favoriteItens[indexPath.row].image)
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        selectedItem = favoriteItens[indexPath.row]
        
        performSegue(withIdentifier: "favToInfo", sender: self)
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
