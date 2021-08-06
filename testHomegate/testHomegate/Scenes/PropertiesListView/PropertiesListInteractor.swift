//
//  PropertiesListInteractor.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 05.08.21.
//

import Foundation

class PropertiesListInteractor {
    
    func getProperties() {
        let networkManager = NetworkManager()
        
        networkManager.getAllProperties { response in
            if let items = response.0 {
                print(items)
            } else if let error = response.1 {
                print(error)
            } else {
                print("Something bad happened")
            }
        }
    }
    
}
