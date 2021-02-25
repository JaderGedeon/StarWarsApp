//
//  Film.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 24/02/21.
//

import Foundation

struct Film: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: FilmResult
    
}

struct FilmResult: Codable {
    
    var properties: FilmProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?
    
}

struct FilmProperties: Codable {
    
    var title: String? // The title of this film
    var episode_id: Int? // The episode number of this film.
    var opening_crawl: String? // The opening paragraphs at the beginning of this film.
    var director: String? // The name of the director of this film.
    var producer: String? // The name(s) of the producer(s) of this film. Comma separated.
    var release_date: String? // The ISO 8601 date format of film release at original creator country.
    var species: [String]? // An array of species resource URLs that are in this film.
    var starships: [String]? // An array of starship resource URLs that are in this film.
    var vehicles: [String]? // An array of vehicle resource URLs that are in this film.
    var characters: [String]? // An array of people resource URLs that are in this film.
    var planets: [String]? // An array of planet resource URLs that are in this film.
    var url: String? // the hypermedia URL of this resource.
    var created: String? // the ISO 8601 date format of the time that this resource was created.
    var edited: String? //  the ISO 8601 date format of the time that this resource was edited.
        
}
