//
//  CharctersModel.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

// MARK: - Photos
struct Photos: Codable {
    let info: Info?
    let results: [CharcterResult]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - CharcterResult
struct CharcterResult: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
