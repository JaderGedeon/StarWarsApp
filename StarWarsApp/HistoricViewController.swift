//
//  HistoricViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

var lastOpenedItens: Array<StarWarsElement>! = []

class HistoricViewController: UICollectionViewController {

    var selectedItem : StarWarsElement!
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFill
        
        self.collectionView.backgroundView = bgImageView
        
        if lastOpenedItens.isEmpty {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return lastOpenedItens.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: lastOpenedItens[indexPath.row].name ?? "Null", itemImage: lastOpenedItens[indexPath.row].image)
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var tempItem : StarWarsElement!
        
        selectedItem = lastOpenedItens[indexPath.row]
    
        performSegue(withIdentifier: "histToInfo", sender: self)
        
        if let index = lastOpenedItens.firstIndex(where: { (item) -> Bool in
            item.name == lastOpenedItens[indexPath.row].name
        }) {
            tempItem = lastOpenedItens[indexPath.row]
            lastOpenedItens.remove(at: index)
        }
        
        lastOpenedItens.insert(tempItem, at: 0)
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



