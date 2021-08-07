//
//  StorageManager+properties.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 06.08.21.
//

import Foundation

extension StorageManager {
    
    func saveProperty(_ property: Property) {
        var properties: [Property] = getProperties()
        
        if let ele = properties.firstIndex(where: { $0.id == property.id }) {
            properties[ele] = property
        } else {
            properties.append(property)
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(properties)

            userDefaults.set(data, forKey: "property")

        } catch {
            print(PropertyError.storage(error.localizedDescription))
        }
    }
    
    func getProperties() -> [Property] {
        
        if let data = userDefaults.data(forKey: "property") {
            do {
                let decoder = JSONDecoder()
                let properties = try decoder.decode([Property].self, from: data)
                
                return properties

            } catch {
                print(PropertyError.storage(error.localizedDescription))
            }
        }
        
        return []
    }
}
