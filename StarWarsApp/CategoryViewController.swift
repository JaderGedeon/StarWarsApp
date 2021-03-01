//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class CategoryViewController: UICollectionViewController,  UITextFieldDelegate {

    var categories: [String] = [""]
    var searchedItens: [String] = [""]
    let image = UIImage(named: "HanSolo")
    var id = 0
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var backBttn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch category {
        case .people:
            categories = ["Han Vader", "Darth Vader", "Luke Skywalker", "Leia Vader"]
            
        case .species:
            categories = ["Wookies", "Ewoks", "Twileks"]
            
        case .starships:
            categories = ["Corvette", "Destroyer", "Millenium Falcom"]
            
        default:
            print("failed to request")
        }

        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
        searchBar.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchedItens.contains(""){
            return categories.count
        }
        else{
            return searchedItens.count
        }
        
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            
            if searchedItens.contains(""){
                itemCell.configure(with: categories[indexPath.row], itemImage: image!)
            }
            else{
                itemCell.configure(with: searchedItens[indexPath.row], itemImage: image!)
            }
            
            
            cell = itemCell
            cell.layer.cornerRadius = 25
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        id = indexPath.row + 1
        performSegue(withIdentifier: "InfoViewCat", sender: self)
        
        if lastOpenedItens.contains(categories[indexPath.row]){
            return
        }else{
            lastOpenedItens.insert(categories[indexPath.row], at: 0)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InfoViewController {
            let vc = segue.destination as? InfoViewController
            vc?.itemCategory = category
            vc?.itemID = id
        }
    }
    
    
    // MARK:- UITextFieldDelegates
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        self.searchedItens.removeAll()
        for str in categories{
            searchedItens.append(str)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchBar.text?.count != 0{
            self.searchedItens.removeAll()
            
            for str in categories{
                let range = str.lowercased().range(of: searchBar.text!, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    self.searchedItens.append(str)
                }
            }
        }
        
        self.collectionView.reloadData()
        return true
    }

}
