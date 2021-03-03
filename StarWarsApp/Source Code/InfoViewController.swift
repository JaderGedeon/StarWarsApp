//
//  InfoViewController.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 23/02/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView! {
        didSet {
            let nibName = UINib(nibName: "InfoTableViewCell", bundle: nil)
            infoTableView.register(nibName, forCellReuseIdentifier: "IdInfoCell")
            infoTableView.dataSource = self
        }
    }
    
    var selectedName : String = ""
    var selectedImage : UIImage = #imageLiteral(resourceName: "Han Solo Teste")
    
    var savedInDB : Bool = false
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    let apiManager = APIManager()
    
    var itemCategory: requestTypes? = nil
    var itemID: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemImage.image = selectedImage
        titleName.text = selectedName
        
        titleName.layer.masksToBounds = true
        titleName.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        titleName.layer.cornerRadius = 25
        
        itemImage.layer.masksToBounds = true
        itemImage.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        itemImage.layer.cornerRadius = 25
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name(rawValue: "JSON_OK"), object: nil)
        
        savedInDB = apiManager.Request(requestType: itemCategory!, uid: itemID, name: selectedName)
        
        if savedInDB {
            favButton.image = UIImage.init(systemName: "bookmark.fill")
        } else {
            favButton.image = UIImage.init(systemName: "bookmark")
        }
    
    }
    
    
    @IBAction func favoriteAnItem(_ sender: UIBarButtonItem) {
        
        if savedInDB {
            // Desfavoritar
            favButton.image = UIImage.init(systemName: "bookmark")
            
            apiManager.requestDB.deleteItem(name: selectedName)
            
        } else {
            // Favoritar
            favButton.image = UIImage.init(systemName: "bookmark.fill")
            
            apiManager.requestDB.SaveItem(itemKey: apiManager.originalArrayOfTags, itemProperties: apiManager.arrayOfAnswer, name: selectedName)
            
        }
        
        savedInDB = !savedInDB
    }
    
    
    @objc func reloadTableView() {

        DispatchQueue.main.async {
            
            self.height.constant = 0

            self.infoTableView.reloadData()
            
            var rows = 0

            for i in 0..<self.infoTableView.numberOfSections {

                rows += self.infoTableView.numberOfRows(inSection: i)
                
            }
            
            self.height.constant = (self.infoTableView.cellForRow(at: IndexPath(item: 0, section: 0))?.frame.height ?? 0) * CGFloat(rows)
            
        }
    }
}

extension InfoViewController:UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiManager.arrayOfTags.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = infoTableView.dequeueReusableCell(withIdentifier: "IdInfoCell") as! InfoTableViewCode
        
        cell.apiTag.text = apiManager.arrayOfTags[indexPath.row]
        cell.apiAnswer.text = apiManager.arrayOfAnswer[indexPath.row]
        
        cell.backgroundColor = .clear
        
        return cell
    }
}
