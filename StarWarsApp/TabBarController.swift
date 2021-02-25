//
//  TabBarController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 24/02/21.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let barHeight : CGFloat = 80
        tabBar.frame.size.height = barHeight
        tabBar.frame.size.width = 10
    }
}
