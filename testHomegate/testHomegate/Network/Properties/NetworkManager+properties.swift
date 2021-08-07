//
//  NetworkManager+properties.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Combine

extension NetworkManager {
    
    func getAllProperties() -> AnyPublisher<PropertiesResponse, PropertyError> {
        return properties(with: makePropertiesComponents())
    }
    
    private func makePropertiesComponents() -> URLComponents {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = "private-492e5-homegate1.apiary-mock.com"
        components.path = "/properties"
        
        return components
    }
}
