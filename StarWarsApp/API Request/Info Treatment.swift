//
//  Info Treatment.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 26/02/21.
//

import Foundation

class InfoTreatment {
    
    var peopleDictionary = ["name":"Nome",
                            "birth_year":"Data de Nascimento"]
    
    public func treatRequest(type: requestTypes, requestString: String) -> String{
        
        var translatedString: String = requestString
        
        switch type {
        case .people:
            
            if peopleDictionary.keys.contains(requestString) {
                translatedString = "\(peopleDictionary[requestString]!):"
            }
            
            break
            
        case .starships:
            
            break
           
        case .films:
            
            break
            
        case .planets:
            
            break
            
        case .species:
            
            break
            
        case .vehicles:
            
            break
                    
        }
        
        return translatedString
    }
}
