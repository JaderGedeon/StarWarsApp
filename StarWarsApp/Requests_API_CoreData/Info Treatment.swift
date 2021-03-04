//
//  Info Treatment.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 26/02/21.
//

import Foundation

class InfoTreatment {
    
    var peopleDictionary = ["name": "Nome",
                            "birth_year": "Data de Nascimento",
                            "eye_color": "Cor dos olhos",
                            "gender" : "Sexo",
                            "hair_color": "Cor do cabelo",
                            "height": "Altura",
                            "mass": "Massa",
                            "skin_color": "Cor da pele",
                            "homeworld": "Planeta natal",
                            "films": "Filmes",
                            "species": "Espécie",
                            "starships": "Naves",
                            "vehicles": "Veículos"
    ]
    
    var starshipsDictionary = [
        "name": "Nome",
        "model": "Modelo",
        "starship_class": "Classe da nave",
        "manufacturer": "Fabricante",
        "cost_in_credits": "Custo em créditos",
        "length": "Comprimento",
        "crew": "Tripulação",
        "passengers": "Passageiros",
        "max_atmosphering_speed": "Velocidade atmosférica máxima",
        "hyperdrive_rating": "Classe do hiperdrive",
        "MGLT": "Megalights (Velocidade)",
        "cargo_capacity": "Capacidade de carga",
        "consumables": "Consumíveis",
        "films": "Filmes",
        "pilots": "Pilotos",
    ]
    
    var filmsDictionary = [
        "title": "Título",
        "episode_id": "ID do episódio",
        "opening_crawl": "Introdução inicial",
        "director": "Diretor",
        "producer": "Produtor",
        "release_date": "Data de lançamento",
        "species": "Espécies",
        "starships": "Naves",
        "vehicles": "Veículos",
        "characters": "Personagens",
        "planets": "Planetas",
    ]
    
    var planetsDictionary = [
        "name": "Nome",
        "diameter": "Diâmetro",
        "rotationPeriod": "Período de rotação",
        "orbitalPeriod": "Período orbital",
        "gravity": "Gravidade",
        "population": "População",
        "climate": "Clima",
        "terrain": "Terreno",
        "surfaceWater": "Porcentagem de água",
        "residents": "Residentes",
        "films": "Filmes"
    ]
    
    var speciesDictionary = [
        "name": "Nome",
        "classification": "Classificação",
        "designation": "Designação",
        "averageHeight": "Altura média",
        "averageLifespan": "Tempo de vida média",
        "eyeColors": "Cores de olhos",
        "hairColors": "Cores de cabelo",
        "skinColors": "Cores de pele",
        "homeworld": "Planeta Natal",
        "language": "Idioma",
        "people": "Pessoas",
        "films": "Filmes"
    ]
    
    var vehiclesDictionary = [
        "name": "Nome",
        "model": "Modelo",
        "vehicle_class": "Classe do veículo",
        "manufacturer": "Fabricante",
        "cost_in_credits": "Custo em créditos",
        "length": "Comprimento",
        "crew": "Tripulação",
        "passengers": "Passageiros",
        "max_atmosphering_speed": "Velocidade ",
        "cargo_capacity": "Capacidade de carga",
        "consumables": "Consumíveis",
        "films": "Filmes",
        "pilots": "Pilotos",
    ]
    
    
    public func treatRequest(type: requestTypes, requestString: String) -> String{
        
        var translatedString: String = requestString
        
        switch type {
        case .people:
            
            if peopleDictionary.keys.contains(requestString) {
                translatedString = "\(peopleDictionary[requestString]!):"
            }
            
            break
            
        case .starships:
            
            if starshipsDictionary.keys.contains(requestString) {
                translatedString = "\(starshipsDictionary[requestString]!):"
            }
            
            break
            
        case .films:
            
            if filmsDictionary.keys.contains(requestString) {
                translatedString = "\(filmsDictionary[requestString]!):"
            }
            
            break
            
        case .planets:
            
            if planetsDictionary.keys.contains(requestString) {
                translatedString = "\(planetsDictionary[requestString]!):"
            }
            
            break
            
        case .species:
            
            if speciesDictionary.keys.contains(requestString) {
                translatedString = "\(speciesDictionary[requestString]!):"
            }
            
            break
            
        case .vehicles:
            
            if vehiclesDictionary.keys.contains(requestString) {
                translatedString = "\(vehiclesDictionary[requestString]!):"
            }
            
            break
            
        }
        
        return translatedString
    }
}
