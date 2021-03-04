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
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
        
        if favoriteItens.isEmpty {
            let image = UIImage(named: "EmptyBar")!
            let scalableImage = CGSize(width: image.size.width * 0.8, height: image.size.height * 0.8)
            
            let renderer = UIGraphicsImageRenderer(size: scalableImage)
            let scaledImage = renderer.image { _ in
                image.draw(in: CGRect(origin: .zero, size: scalableImage))
            }
            
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: scaledImage.size.width, height: scaledImage.size.height))
            label.center = CGPoint ( x: UIScreen.main.bounds.size.width*0.5, y: UIScreen.main.bounds.size.height*0.5 )
            label.textAlignment = .center
            label.text = "No item present"
            label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

            label.backgroundColor = UIColor(patternImage: scaledImage)
            
            self.collectionView.backgroundView?.addSubview(label)
        }
        
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
