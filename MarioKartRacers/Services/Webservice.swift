//
//  Webservices.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation

enum FetchError: Error {
    case invalidServerResponse
}

final class Webservice {
    
    func getData(url: URL) async throws -> Data {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // validates if the response is valid
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                    throw FetchError.invalidServerResponse
            }
        
        return data
    }
}
