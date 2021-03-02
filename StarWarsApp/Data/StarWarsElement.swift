//
//  StarWarsElement.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 02/03/21.
//

import UIKit

enum imageOrientation {
    case portrait
    case landscape
}

class StarWarsElement {
    
    var name: String?
    var category: requestTypes?
    var apiID: Int?
    var image: UIImage
    var imageOrientation: imageOrientation?
    
    init(name: String, cat: requestTypes, apiID: Int, image: UIImage, imgOrientation: imageOrientation) {
        self.name = name
        self.category = cat
        self.apiID = apiID
        self.image = image
        self.imageOrientation = imgOrientation
    }
}
