//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class CategoryViewController: UICollectionViewController,  UITextFieldDelegate {

    var starWarsItens : Array<StarWarsElement>!
    
    //var categories: [String] = [""]
    //var searchedItens: [String] = [""]
    //let image = UIImage(named: "HanSolo")
    var searchedItens : Array<StarWarsElement>! = []
    var id = 0
    
    var swList = StarWarsList()
    var api = APIManager()
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var backBttn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starWarsItens = swList.returnAllObjectsOfType(requestType: category)
//
//        switch category {
//        case .people:
//            categories = ["Han Vader", "Darth Vader", "Luke Skywalker", "Leia Vader"]
//
//        case .species:
//            categories = ["Wookies", "Ewoks", "Twileks"]
//
//        case .starships:
//            categories = ["Corvette", "Destroyer", "Millenium Falcom"]
//
//        default:
//            print("failed to request")
//        }

        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        
        self.collectionView.backgroundView = bgImageView
        searchBar.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //if searchedItens.contains(""){
        if searchBar.text?.count == 0 {
//            return categories.count
            return starWarsItens.count
        }
        else{
            return searchedItens.count
        }
        
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            
            //if searchedItens.contains(""){
            if searchBar.text?.count == 0 {
                //itemCell.configure(with: categories[indexPath.row], itemImage: image!)
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
        
        id = starWarsItens[indexPath.row].apiID!
        performSegue(withIdentifier: "InfoViewCat", sender: self)
        
        if !(lastOpenedItens.contains { (item) -> Bool in
            item.name == starWarsItens[indexPath.row].name
        }) {
            lastOpenedItens.insert(starWarsItens[indexPath.row], at: 0)
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
