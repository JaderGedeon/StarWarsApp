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
        StarWarsElement.init(name: "Jabba Desilijic Tiure", cat: .people, apiID: 16, image: #imageLiteral(resourceName: "p16"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Wedge Antilles", cat: .people, apiID: 18, image: #imageLiteral(resourceName: "p18"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Jek Tono Porkins", cat: .people, apiID: 19, image: #imageLiteral(resourceName: "p19"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Yoda", cat: .people, apiID: 20, image: #imageLiteral(resourceName: "p20"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Palpatine", cat: .people, apiID: 21, image: #imageLiteral(resourceName: "p21"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Boba Fett", cat: .people, apiID: 22, image: #imageLiteral(resourceName: "p22"), imgOrientation: .landscape),
        StarWarsElement.init(name: "IG-88", cat: .people, apiID: 23, image: #imageLiteral(resourceName: "p23"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Bossk", cat: .people, apiID: 24, image: #imageLiteral(resourceName: "p24"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Lando Calrissian", cat: .people, apiID: 25, image: #imageLiteral(resourceName: "p25"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Lobot", cat: .people, apiID: 26, image: #imageLiteral(resourceName: "p26"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Ackbar", cat: .people, apiID: 27, image: #imageLiteral(resourceName: "p27"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Mon Mothma", cat: .people, apiID: 28, image: #imageLiteral(resourceName: "p28"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Arvel Crynyd", cat: .people, apiID: 29, image: #imageLiteral(resourceName: "p29"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Wicket Systri Warrick", cat: .people, apiID: 30, image: #imageLiteral(resourceName: "p30"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Nien Nunb", cat: .people, apiID: 31, image: #imageLiteral(resourceName: "p31"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Qui-Gon Jinn", cat: .people, apiID: 32, image: #imageLiteral(resourceName: "p32"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Nute Gunray", cat: .people, apiID: 33, image: #imageLiteral(resourceName: "p33"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Finis Valorum", cat: .people, apiID: 34, image: #imageLiteral(resourceName: "p34"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Padmé Amidala", cat: .people, apiID: 35, image: #imageLiteral(resourceName: "p35"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Jar Jar Binks", cat: .people, apiID: 36, image: #imageLiteral(resourceName: "p36"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Roos Tarpals", cat: .people, apiID: 37, image: #imageLiteral(resourceName: "p37"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Rugor Nass", cat: .people, apiID: 38, image: #imageLiteral(resourceName: "p38"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Ric Olié", cat: .people, apiID: 39, image: #imageLiteral(resourceName: "p39"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Watto", cat: .people, apiID: 40, image: #imageLiteral(resourceName: "p40"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Sebulba", cat: .people, apiID: 41, image: #imageLiteral(resourceName: "p41"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Quarsh Panaka", cat: .people, apiID: 42, image: #imageLiteral(resourceName: "p42"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Shmi Skywalker", cat: .people, apiID: 43, image: #imageLiteral(resourceName: "p43"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Darth Maul", cat: .people, apiID: 44, image: #imageLiteral(resourceName: "p44"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Bib Fortuna", cat: .people, apiID: 45, image: #imageLiteral(resourceName: "p45"), imgOrientation: .landscape),
        StarWarsElement.init(name: "Ayla Secura", cat: .people, apiID: 46, image: #imageLiteral(resourceName: "p46"), imgOrientation: .landscape),
        
        
        
        
        
        StarWarsElement.init(name: "Terra", cat: .planets, apiID: 1, image: #imageLiteral(resourceName: "IconHomeSelected-2"), imgOrientation: .landscape)
    ]
    
    func returnAllObjectsOfType(requestType: requestTypes) -> Array<StarWarsElement> {
        return self.list.filter { $0.category == requestType }
    }
}
