//
//  Webservices.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation

enum FetchError: Error {
    case invalidServerResponse
}

class Webservice {
    
    func getDriverData(url: URL) async throws -> [Driver] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                    throw FetchError.invalidServerResponse
            }
        
        return try JSONDecoder().decode([Driver].self, from: data)
    }
}
