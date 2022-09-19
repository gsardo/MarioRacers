//
//  DataMapper.swift
//  MarioKartRacers
//
//  Created by Mathilde Ferrand-Coeurderoy on 19/09/2022.
//

import Foundation

public struct DataMapper<T: Decodable> {
    public let map: (Data) throws -> T
}

// MARK: - Live implementation

public extension DataMapper {

    static func live() -> Self {
        return .init(
            map: { body in
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: body)
            }
        )
    }
}

// MARK: - Mock implementation

#if DEBUG
public extension DataMapper {

    static func spy(
        mapFuncTest: @escaping (Data) -> Void = { _ in },
        mapMock: @escaping () throws -> T
    ) -> Self {
        Self {
            mapFuncTest($0)
            return try mapMock()
        }
    }

    static func mock(map: @escaping () throws -> T) -> Self {
        Self(
            map: { _ in try map() }
        )
    }
}
#endif
