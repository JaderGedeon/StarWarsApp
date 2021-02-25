//
//  APIRequest.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 24/02/21.
//

import Foundation

enum requestTypes: String {
    case people = "Personagens"
    case films = "Filmes"
    case starships = "Naves"
    case planets = "Planetas"
    case species = "Espécies"
    case vehicles = "Veículos"
}

class APIManager {
    
    var arrayOfTags:[String] = []
    var arrayOfAnswer:[String] = []
    
    public func Request(requestType: requestTypes, uid: Int){
        
        let urlString = "https://www.swapi.tech/api/\(requestType)/\(uid)"
        let url = URL(string: urlString)
        
        guard url != nil else {
            debugPrint("URL is nil")
            // Tratar erro
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    var conditionMirror: Mirror? = nil
                    
                    switch requestType {
                    case .people:
                        let requestData = try decoder.decode(People.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    case .starships:
                        let requestData = try decoder.decode(Starship.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    case .films:
                        let requestData = try decoder.decode(Film.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    case .planets:
                        let requestData = try decoder.decode(Planet.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    case .species:
                        let requestData = try decoder.decode(Species.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    case .vehicles:
                        let requestData = try decoder.decode(Vehicles.self, from: data!)
                        conditionMirror = Mirror(reflecting: requestData.result.properties)
                    }

                    for (label, value) in conditionMirror!.children {
                        if value as? String != nil {
                            
                            self.arrayOfTags.append(label!)
                            self.arrayOfAnswer.append(value as! String)
                                           
                        }
                    }
                } catch {
                    debugPrint(error)
                }
            }
            NotificationCenter.default.post(name: Notification.Name("JSON_OK"), object: nil)
        }
        dataTask.resume();
    }
}

