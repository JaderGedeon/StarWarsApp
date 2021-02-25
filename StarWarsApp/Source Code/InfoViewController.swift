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
    
    let apiManager = APIManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedName.layer.masksToBounds = true
        selectedName.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        selectedName.layer.cornerRadius = 25
        
        selectedPicture.layer.masksToBounds = true
        selectedPicture.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        selectedPicture.layer.cornerRadius = 25
        
        apiManager.Request(requestType: .vehicles, uid: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: Notification.Name(rawValue: "JSON_OK"), object: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func reloadTableView() {
        DispatchQueue.main.async {
            self.infoTableView.reloadData()
        }
    }
}

extension InfoViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiManager.arrayOfTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = infoTableView.dequeueReusableCell(withIdentifier: "IdInfoCell") as! InfoTableViewCode
        
        cell.apiTag.text = apiManager.arrayOfTags[indexPath.row]
        cell.apiAnswer.text = apiManager.arrayOfAnswer[indexPath.row]
        
        cell.backgroundColor = .clear
        
        return cell
        
    }
}
