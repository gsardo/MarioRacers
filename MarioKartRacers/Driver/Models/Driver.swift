//
//  Driver.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation

struct Driver: Decodable {
    
    // this is where we decode the data and properties that we want to use
    
    let name: String
    let specialSkill: String
    let debutTour: String
    
    enum CodingKeys: String, CodingKey {
        case specialSkill = "special_skill"
        case debutTour = "debut_tour"
        case name
    }
}
