//
//  StorageProtocol.swift
//  testHomegate
//
//  Created by Pietro Gandolfi on 06.08.21.
//

import Foundation

protocol StorageProtocol {
    func saveProperty(_ property: Property)
    func getProperties() -> [Property]
}
