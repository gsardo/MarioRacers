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

final class Webservice {
    
    // this fetches data from the API and returns an array of Driver data
    func getDriverData(url: URL) async throws -> [Driver] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // validates if the response is valid
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                    throw FetchError.invalidServerResponse
            }
        
        //this decodes the data into an array of Drivers and return it from the function
        return try JSONDecoder().decode([Driver].self, from: data)
    }
}
