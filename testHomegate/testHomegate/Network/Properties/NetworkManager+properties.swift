//
//  NetworkManager+properties.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getAllProperties(completion: @escaping (([PropertyItem]?, Error?)) -> Void) {
        _ = self.request(.getAllProperties) { result in
            switch result {
            case .success(let response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusAndRedirectCodes()
                    let propertiesResponse = try filteredResponse.map(PropertiesResponse.self)
                    
                    completion((propertiesResponse.items, nil))
                } catch {

                    completion((nil, error))
                }
                
            case .failure(let error):
                completion((nil, error))
            }
        }
    }
    
}
