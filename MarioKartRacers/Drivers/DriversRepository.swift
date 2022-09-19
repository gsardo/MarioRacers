//
//  DriversRepository.swift
//  MarioKartRacers
//
//  Created by Mathilde Ferrand-Coeurderoy on 19/09/2022.
//

import Foundation

struct DriversRepository {
    private let service: Webservice
    private let mapper: DataMapper<[Driver]>
    
    init(
        service: Webservice = Webservice(),
        mapper: DataMapper<[Driver]> = .live()
    ) {
        self.service = service
        self.mapper = mapper
    }
    
    func getDrivers() async throws -> [Driver] {
        let result = try await service.getData(url: Constants.Urls.drivers)
        do {
            return try mapper.map(result)
        }
        catch {
            throw InternalError.mapError
        }
    }
}

private extension DriversRepository {
    enum InternalError: Error {
        case mapError
    }
}
