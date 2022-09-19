//
//  DriverViewModel.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation

final class DriverViewModel {
    
    private(set) var drivers: [Driver] = []
    private let repository: DriversRepository
    weak var view: DriversView?
    
    init(
        repository: DriversRepository = DriversRepository()
    ) {
        self.repository = repository
    }
    
    func populateDriverData() async {
        Task { @MainActor in
            if let drivers = try? await repository.getDrivers() {
                self.drivers = drivers
                view?.refresh(with: .loaded)
            } else {
                view?.refresh(with: .error)
            }
        }
    }
}
