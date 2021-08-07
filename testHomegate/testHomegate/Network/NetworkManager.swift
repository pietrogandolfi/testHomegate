//
//  testHomegateApp.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func getAllProperties() -> AnyPublisher<PropertiesResponse, PropertyError>
}

class NetworkManager: NetworkManagerProtocol {
    private let sessione: URLSession
    
    init(sessione: URLSession = .shared) {
        self.sessione = sessione
    }
    
    func properties<T>(with components: URLComponents) -> AnyPublisher<T, PropertyError> where T: Decodable {
        guard let url = components.url else {
            let error = PropertyError.network("Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return sessione.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .network(error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                self.decode(pair.data)
            }
            .eraseToAnyPublisher()
    }

    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, PropertyError> {
        let decoder = JSONDecoder()
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                .parsing(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
