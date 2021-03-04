//
//  InfoTableViewCell.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 23/02/21.
//

import UIKit

class InfoTableViewCode: UITableViewCell {

    @IBOutlet weak var apiTag: UILabel!
    @IBOutlet weak var apiAnswer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
