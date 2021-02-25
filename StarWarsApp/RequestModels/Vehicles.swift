//
//  Vehicles.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 25/02/21.
//

import Foundation

struct Vehicles: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: VehiclesResult
    
}

struct VehiclesResult: Codable {
    
    var properties: VehiclesProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?
    
}

struct VehiclesProperties: Codable {
    
    var name: String? // The name of this vehicle. The common name, such as "Death Star".
    var model: String? // The model or official name of this vehicle. Such as "T-65 X-wing" or "DS-1 Orbital Battle Station".
    var vehicle_class: String? // The class of this vehicle, such as "Starfighter" or "Deep Space Mobile Battlestation"
    var manufacturer: String? // The manufacturer of this vehicle. Comma separated if more than one.
    var cost_in_credits: String? // The cost of this vehicle new, in galactic credits.
    var length: String? // The length of this vehicle in meters.
    var crew: String? // The number of personnel needed to run or pilot this vehicle.
    var passengers: String? // The number of non-essential people this vehicle can transport.
    var max_atmosphering_speed: String? // The maximum speed of this vehicle in the atmosphere. "N/A" if this vehicle is incapable of atmospheric flight.
    var cargo_capacity: String? // The maximum number of kilograms that this vehicle can transport.
    var consumables: String? // The maximum length of time that this vehicle can provide consumables for its entire crew without having to resupply.
    var films: [String]? // An array of Film URL Resources that this vehicle has appeared in.
    var pilots: [String]? // An array of People URL Resources that this vehicle has been piloted by.
    var url: String? // the hypermedia URL of this resource.
    var created: String? // the ISO 8601 date format of the time that this resource was created.
    var edited: String? // the ISO 8601 date format of the time that this resource was edited.
    
}
