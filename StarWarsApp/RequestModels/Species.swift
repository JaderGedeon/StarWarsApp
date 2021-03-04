//
//  Species.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 25/02/21.
//

import Foundation

struct Species: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: SpeciesResult
    
}

struct SpeciesResult: Codable {
    
    var properties: SpeciesProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?
    
}

struct SpeciesProperties: Codable {
    
    var name: String? // The name of this species.
    var classification: String? // The classification of this species, such as "mammal" or "reptile".
    var designation: String? // The designation of this species, such as "sentient".
    var averageHeight: String? // The average height of this species in centimeters.
    var averageLifespan: String? // The average lifespan of this species in years.
    var eyeColors: String? // A comma-separated string of common eye colors for this species, "none" if this species does not typically have eyes.
    var hairColors: String? // A comma-separated string of common hair colors for this species, "none" if this species does not typically have hair.
    var skinColors: String? // A comma-separated string of common skin colors for this species, "none" if this species does not typically have skin.
//    var homeworld: String? // The URL of a planet resource, a planet that this species originates from.
    var language: String? // The language commonly spoken by this species.
//    var people: [String]? // An array of People URL Resources that are a part of this species.
//    var films: [String]? // An array of Film URL Resources that this species has appeared in.
//    var url: String? // the hypermedia URL of this resource.
//    var created: String? // the ISO 8601 date format of the time that this resource was created.
//    var edited: String? // the ISO 8601 date format of the time that this resource was edited.
    
}
