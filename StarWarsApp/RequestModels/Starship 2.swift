//
//  Starship.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 24/02/21.
//

import Foundation

struct Starship: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: StarshipResult
    
}

struct StarshipResult: Codable {
    
    var properties: StarshipProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?
    
}

struct StarshipProperties: Codable {
    
    var name: String? // The name of this starship. The common name, such as "Death Star".
    var model: String? // The model or official name of this starship. Such as "T-65 X-wing" or "DS-1 Orbital Battle Station".
    var starship_class: String? // The class of this starship, such as "Starfighter" or "Deep Space Mobile Battlestation"
    var manufacturer: String? // The manufacturer of this starship. Comma separated if more than one.
    var cost_in_credits: String? // The cost of this starship new, in galactic credits.
    var length: String? // The length of this starship in meters.
    var crew: String? // The number of personnel needed to run or pilot this starship.
    var passengers: String? // The number of non-essential people this starship can transport.
    var max_atmosphering_speed: String? // The maximum speed of this starship in the atmosphere. "N/A" if this starship is incapable of atmospheric flight.
    var hyperdrive_rating: String? // The class of this starships hyperdrive.
    var MGLT: String? // he Maximum number of Megalights this starship can travel in a standard hour. A "Megalight" is a standard unit of distance and has never been defined before within the Star Wars universe. This figure is only really useful for measuring the difference in speed of starships. We can assume it is similar to AU, the distance between our Sun (Sol) and Earth.
    var cargo_capacity: String? // The maximum number of kilograms that this starship can transport.
    var consumables: String? // The maximum length of time that this starship can provide consumables for its entire crew without having to resupply.
    var films: [String]? // An array of Film URL Resources that this starship has appeared in.
    var pilots: [String]? // An array of People URL Resources that this starship has been piloted by.
    var url: String? // the hypermedia URL of this resource.
    var created: String? // the ISO 8601 date format of the time that this resource was created.
    var edited: String? // the ISO 8601 date format of the time that this resource was edited.
    
}
