//
//  NavigationViewController.swift
//  StarWarsApp
//
//  Created by Denys Roger on 02/03/21.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBttnImage = UIImage(named: "IconReturn-2")
        let barAppearance = UINavigationBar.appearance()
        
        barAppearance.backIndicatorImage = backBttnImage
        barAppearance.backIndicatorTransitionMaskImage = backBttnImage
        barAppearance.tintColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        navigationBar.backItem?.title = ""
        navigationBar.setBackgroundImage(_:UIImage(), for: .default)
        
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
