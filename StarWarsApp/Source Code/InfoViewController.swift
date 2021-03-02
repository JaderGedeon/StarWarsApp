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
    
    @IBOutlet weak var selectedPicture: UIImageView!
    @IBOutlet weak var selectedName: UILabel!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    let apiManager = APIManager()
    
    var itemCategory: requestTypes? = nil
    var itemID: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedName.layer.masksToBounds = true
        selectedName.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        selectedName.layer.cornerRadius = 25
        
        selectedPicture.layer.masksToBounds = true
        selectedPicture.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        selectedPicture.layer.cornerRadius = 25
        
        apiManager.Request(requestType: itemCategory!, uid: itemID)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name(rawValue: "JSON_OK"), object: nil)
    
    }
    
    @objc func reloadTableView() {
        DispatchQueue.main.async {
            
            self.height.constant = 0

            self.infoTableView.reloadData()
            
            var rows = 0

            for i in 0..<self.infoTableView.numberOfSections {
                
                print(i)
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
