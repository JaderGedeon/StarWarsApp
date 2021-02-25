//
//  Planet.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 25/02/21.
//

import Foundation

struct Planet: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: PlanetResult
    
}

struct PlanetResult: Codable {
    
    var properties: PlanetProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?
    
}

struct PlanetProperties: Codable {
    
    var name: String? // The name of this planet.
    var diameter: String? // The diameter of this planet in kilometers.
    var rotationPeriod: String? // The number of standard hours it takes for this planet to complete a single rotation on its axis.
    var orbitalPeriod: String? // The number of standard days it takes for this planet to complete a single orbit of its local star.
    var gravity: String? // A number denoting the gravity of this planet, where "1" is normal or 1 standard G. "2" is twice or 2 standard Gs. "0.5" is half or 0.5 standard Gs.
    var population: String? // The average population of sentient beings inhabiting this planet.
    var climate: String? // The climate of this planet. Comma separated if diverse.
    var terrain: String? // The terrain of this planet. Comma separated if diverse.
    var surfaceWater: String? // The percentage of the planet surface that is naturally occurring water or bodies of water.
    var residents: [String]? // An array of People URL Resources that live on this planet.
    var films: [String]? // An array of Film URL Resources that this planet has appeared in.
    var url: String? // the hypermedia URL of this resource.
    var created: String? // the ISO 8601 date format of the time that this resource was created.
    var edited: String? // the ISO 8601 date format of the time that this resource was edited.
    
}
