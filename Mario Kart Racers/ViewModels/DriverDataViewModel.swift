//
//  DriverDataViewModel.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation

class DriverDataViewModel {
    
    private(set) var drivers: [DriverViewModel] = []
    
    func populateDriverData(url: URL) async {
        
        do {
            let drivers = try await Webservice().getDriverData(url: url)
            self.drivers = drivers.map(DriverViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct DriverViewModel {
    private let driver: Driver
    
    init(driver: Driver) {
        self.driver = driver
    }
    
    var name: String {
        driver.name
    }
    
    var specialSkill: String {
        driver.specialSkill
    }
    
    var debutTour: String {
        driver.debutTour
    }
}
