//
//  CollectionViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 23/02/21.
//

import UIKit

var category: requestTypes = .people

class CollectionViewController: UICollectionViewController {
    
    let categories: [requestTypes] = [requestTypes.people,
                                requestTypes.species,
                                requestTypes.starships,
                                requestTypes.vehicles,
                                requestTypes.planets,
                                requestTypes.films]
    
    let imageArray = [UIImage(named: "iconPeople"), UIImage(named: "iconSpecies"), UIImage(named: "iconStarships"), UIImage(named: "iconVehicles"), UIImage(named: "iconPlanets"), UIImage(named: "iconMovies")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFill
        
        self.collectionView.backgroundView = bgImageView

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            itemCell.configure(with: categories[indexPath.row].rawValue, itemImage: imageArray[indexPath.row]!)
            

            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        category = categories[indexPath.row]
        performSegue(withIdentifier: "categories", sender: self)
    }
}

    
