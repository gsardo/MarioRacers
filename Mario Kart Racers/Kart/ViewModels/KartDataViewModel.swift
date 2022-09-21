//
//  KartDataViewModel.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 21/9/2022.
//

import Foundation

class KartDataViewModel {
   
    private(set) var karts: [KartViewModel] = []
    
    func populateKartData(url: URL) async {
        
        do {
            let karts = try await Webservice().getKartData(url: url)
            self.karts = karts.map(KartViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct KartViewModel {
    private let kart: Kart
    
    init(kart: Kart) {
        self.kart = kart
    }
    
    var name: String {
        kart.name
    }
    
    var specialSkill: String {
        kart.specialSkill
    }
    
    var debutTour: String {
        kart.debutTour
    }
    
}
