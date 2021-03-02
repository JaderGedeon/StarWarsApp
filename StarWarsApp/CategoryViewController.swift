//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class CategoryViewController: UICollectionViewController,  UITextFieldDelegate {

    var starWarsItens : Array<StarWarsElement>!

    var searchedItens : Array<StarWarsElement>! = []
    
    var selectedItem : StarWarsElement!
    
    var swList = StarWarsList()
    var api = APIManager()
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var backBttn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starWarsItens = swList.returnAllObjectsOfType(requestType: category)

        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
        searchBar.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchBar.text?.count == 0 {
            return starWarsItens.count
        }
        else{
            return searchedItens.count
        }
        
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            if searchBar.text?.count == 0 {
                itemCell.configure(with: starWarsItens[indexPath.row].name ?? "Null", itemImage: starWarsItens[indexPath.row].image)
            }
            else{
                itemCell.configure(with: searchedItens[indexPath.row].name ?? "Null", itemImage: searchedItens[indexPath.row].image)
            }
            
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedItem = starWarsItens[indexPath.row]
    
        performSegue(withIdentifier: "InfoViewCat", sender: self)
        
        if let index = lastOpenedItens.firstIndex(where: { (item) -> Bool in
            item.name == starWarsItens[indexPath.row].name
        }) {
            lastOpenedItens.remove(at: index)
        }
        
        lastOpenedItens.insert(starWarsItens[indexPath.row], at: 0)
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
    
    
    // MARK:- UITextFieldDelegates
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        self.searchedItens.removeAll()
        for item in starWarsItens{
            searchedItens.append(item)
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchBar.text?.count != 0{
            self.searchedItens.removeAll()

            for item in starWarsItens{
                let range = item.name!.lowercased().range(of: searchBar.text!, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    self.searchedItens.append(item)
                }
            }
        } else {
            self.searchedItens.removeAll()
        }

        self.collectionView.reloadData()
        return true
    }

}
