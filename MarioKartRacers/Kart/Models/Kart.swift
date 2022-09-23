//
//  Kart.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 23/9/2022.
//

import Foundation

struct Kart: Decodable {

    let name: String
    let specialSkill: String
    let debutTour: String

    enum CodingKeys: String, CodingKey {
        case name
        case specialSkill = "special_skill"
        case debutTour = "debut_tour"
    }
}
