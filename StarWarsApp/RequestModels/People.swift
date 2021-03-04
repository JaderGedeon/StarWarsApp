//
//  People.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 24/02/21.
//

import Foundation

struct People: Codable {
    
    var message: String = "" // "ok" or "not found".
    var result: PeopleResult
    
}

struct PeopleResult: Codable {

    var properties: PeopleProperties
    var description: String?
    var _id: String?
    var uid: String? // Universal ID
    var __v: Int?

}

struct PeopleProperties: Codable {
    
    var name: String? // The name of this person.
    var birth_year: String? // The birth year of the person, using the in-universe standard of BBY or ABY - Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is a battle that occurs at the end of Star Wars episode IV: A New Hope.
    var eye_color: String? // The eye color of this person. Will be "unknown" if not known or "n/a" if the person does not have an eye.
    var gender: String? // The gender of this person. Either "Male", "Female" or "unknown", "n/a" if the person does not have a gender.
    var hair_color: String? // The hair color of this person. Will be "unknown" if not known or "n/a" if the person does not have hair.
    var height: String? // The height of the person in centimeters.
    var mass: String? // The mass of the person in kilograms.
    var skin_color: String? //The skin color of this person.
//    var homeworld: String? // The URL of a planet resource, a planet that this person was born on or inhabits.
//    var films: [String]? // An array of film resource URLs that this person has been in.
//    var species: [String]? // An array of species resource URLs that this person belongs to.
//    var starships: [String]? // An array of starship resource URLs that this person has piloted.
//    var vehicles: [String]? // An array of vehicle resource URLs that this person has piloted.
    //var url: String? // the hypermedia URL of this resource.
    //var created: String? // the ISO 8601 date format of the time that this resource was created.
    //var edited: String? // the ISO 8601 date format of the time that this resource was edited.

}
