//
//  ElementList.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 02/03/21.
//

import UIKit

class StarWarsList {
    
    var list: Array<StarWarsElement> = [
        StarWarsElement.init(name: "Luke", cat: .people, apiID: 1, image: #imageLiteral(resourceName: "Han Solo Teste"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Lukinho", cat: .people, apiID: 2, image: #imageLiteral(resourceName: "ProtHome"), imgOrientation: .landscape),
        
        StarWarsElement.init(name: "Terra", cat: .planets, apiID: 1, image: #imageLiteral(resourceName: "IconHomeSelected-2"), imgOrientation: .landscape)
    ]
    
    func returnAllObjectsOfType(requestType: requestTypes) -> Array<StarWarsElement> {
        return self.list.filter { $0.category == requestType }
    }
}
