//
//  CategoryViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit
import Speech

class CategoryViewController: UICollectionViewController,  UITextFieldDelegate {

    var starWarsItens : Array<StarWarsElement>!
    var searchedItens : Array<StarWarsElement>! = []
    var id = 0
    
    var swList = StarWarsList()
    var api = APIManager()
    
    let voiceBttn = UIButton(type: .custom)
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer()
    let request = SFSpeechAudioBufferRecognitionRequest()
    var started: Bool = false
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starWarsItens = swList.returnAllObjectsOfType(requestType: category)
        
        
        voiceBttn.setImage(UIImage(named: "IconMicrophone-2"), for: .normal)
        voiceBttn.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        
        

        let bgImageView = UIImageView(image: UIImage(named: "BackGround.png"))
        bgImageView.contentMode = .scaleAspectFit
        self.collectionView.backgroundView = bgImageView
        
        
        searchBar.delegate = self
        searchBar.layer.cornerRadius = searchBar.frame.size.height/2
        searchBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        searchBar.textColor = .white
        searchBar.leftView = UIImageView(image: UIImage(named: "IconSearch-2"))
        searchBar.rightView = voiceBttn
        searchBar.leftViewMode = .always
        searchBar.rightViewMode = .always
        searchBar.clipsToBounds = true
        
    }
    
//    MARK:- CollectionView
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
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
    
//    MARK:- Segue Itens
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is InfoViewController {
            let vc = segue.destination as? InfoViewController
            
            vc?.itemCategory = category
            vc?.itemID = id
        }
    }
    
    
    // MARK:- UITextFieldDelegates
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        searchBar.leftView?.isHidden = true
    }
    
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
    
//    MARK:- Voice Recognizer
    
    func requestPermission(){
        self.voiceBttn.isEnabled = false
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation {
                if authState == .authorized{
                  print(("Accepted"))
                }
            }
        }
    }
    
//    MARK:- Alert Function
    
    func alertView(message: String){
        let controller =  UIAlertController.init(title: "Error ocurred..!", message: message, preferredStyle: .alert)
    }
    
}
