//
//  NetworkManager+properties.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getAllProperties() -> [String] {
        var list: [String] = []
        
        let request = self.request(.getAllProperties) { result in
            switch result {
            case .success(let response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusAndRedirectCodes()
                    let propertiesResponse = try filteredResponse.map(PropertiesResponse.self)
//                    let pizzaPlaces = pizzaPlacesResponse.list.places

//                    observer.onNext(pizzaPlaces)
//                    observer.onCompleted()
                    
                    print(propertiesResponse)

                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        return list
    }
    
}
