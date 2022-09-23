//
//  Course.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 23/9/2022.
//

import Foundation

struct Course: Decodable {

    let name: String
    let debutTour: String
    let debutGame: String
    let debutSystem: String

    enum CodingKeys: String, CodingKey {
        case name
        case debutTour = "debut_tour"
        case debutGame = "debut_game"
        case debutSystem = "debut_system"
    }
}
