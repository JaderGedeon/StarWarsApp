//
//  ElementList.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 02/03/21.
//

import UIKit

class StarWarsList {
    
    var list: Array<StarWarsElement> = [
        
        StarWarsElement.init(name: "Luke Skywalker", cat: .people, apiID: 1, image: #imageLiteral(resourceName: "p1"), imgOrientation: .landscape),
        StarWarsElement.init(name: "C-3PO", cat: .people, apiID: 2, image: #imageLiteral(resourceName: "p2"), imgOrientation: .landscape),
        StarWarsElement.init(name: "R2-D2", cat: .people, apiID: 3, image: #imageLiteral(resourceName: "p3"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Darth Vader", cat: .people, apiID: 4, image: #imageLiteral(resourceName: "p4"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Leia Organa", cat: .people, apiID: 5, image: #imageLiteral(resourceName: "p5"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Owen Lars", cat: .people, apiID: 6, image: #imageLiteral(resourceName: "p6"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Beru Whitesun Iars", cat: .people, apiID: 7, image: #imageLiteral(resourceName: "p7"), imgOrientation: .landscape),
        StarWarsElement.init(name: "R5-D4", cat: .people, apiID: 8, image: #imageLiteral(resourceName: "p8"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Biggs Darklighter", cat: .people, apiID: 9, image: #imageLiteral(resourceName: "p9"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Obi-Wan Kenobi", cat: .people, apiID: 10, image: #imageLiteral(resourceName: "p10"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Anakin Skywalker", cat: .people, apiID: 11, image: #imageLiteral(resourceName: "p11"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Wilhuff Tarkin", cat: .people, apiID: 12, image: #imageLiteral(resourceName: "p12"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Chewbacca", cat: .people, apiID: 13, image: #imageLiteral(resourceName: "p13"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Han Solo", cat: .people, apiID: 14, image: #imageLiteral(resourceName: "p14"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Greedo", cat: .people, apiID: 15, image: #imageLiteral(resourceName: "p15"), imgOrientation: .landscape),
        
        StarWarsElement.init(name: "Terra", cat: .planets, apiID: 1, image: #imageLiteral(resourceName: "IconHomeSelected-2"), imgOrientation: .landscape)
    ]
    
    func returnAllObjectsOfType(requestType: requestTypes) -> Array<StarWarsElement> {
        return self.list.filter { $0.category == requestType }
    }
}
